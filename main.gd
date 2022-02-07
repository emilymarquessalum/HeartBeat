extends Node2D


onready var scene = load("res://fake_scene.tscn")
var volume = 100
var distance = 2000
var offset = 0
var _reseters = []
var items = []
var items_id = []
var spawn_point = 1
var background_image = preload("res://resources/backgroyund_1.png")
var current_scene = "res://rooms/main_scene.tscn"
var save_path = "res://save_file.json" 



signal language_changed(new_language)

	
func _process(delta):
	if Input.is_action_just_pressed("exit_game"):
		get_tree().quit()
func _reset_save():
	var data = {}
	_save_game_file(data)
	pass

func _reset():
	for r in _reseters:
		if not r:
			continue
		r._reset()

func _load_save():
	var data = _start_load_save()
	if data.has("items"):
		items_id = data["items"]
	_save_options_settings(data)

func _start_load_save():
	var load_file = File.new()
	var err = load_file.open(save_path, File.READ)
	if err:
		return {}
	var data = JSON.parse(load_file.get_as_text()).result
	
	if data.has("last_scene"):
		current_scene = data["last_scene"]
	if data.has("last_spawn_point"):
		spawn_point = data["last_spawn_point"]
		
	return data	

func _save_options_settings(settings):
	if settings.has("volume"):
		volume = settings["volume"]
	
	AudioServer.set_bus_volume_db(0, 
			linear2db(volume))

func _save_game():
	var data = {}
	data["last_scene"] = current_scene
	data["last_spawn_point"] = spawn_point
	data["items"] = []
	for item in items:
		data['items'].append(item.id)
	
	_save_game_file(data)

func _save_game_file(data):
	var load_file = File.new()
	var err = load_file.open(save_path, File.WRITE)
	if err:
		return
	load_file.store_string(JSON.print(data))

func _start_level():
	get_tree().change_scene(current_scene)
	yield(get_tree().create_timer(0.1), "timeout")
	var its = get_tree().get_current_scene().find_node("items")
	var its_object = get_tree().get_current_scene().find_node("item_objects")
	
	for t in items:
		its._add_item(t,false)
		get_tree().get_current_scene().remove_child(get_tree().get_current_scene().find_node(t["name"]))
		
	for it in its_object.get_children():
		if it.id in items_id:
			its._add_item(it)
			it.get_parent().remove_child(it)
	
	

	
	
func _spawn_rooms():
	for i in range(-5,5,1):
		spawn_row(position.x -offset+ distance*i, position.y,distance,5)

func spawn_row(x,y,step,n):
	for i in range(-n,n,1):
		_spawn_room(x,y + step * i-offset)

func _spawn_room(x,y):
	if x == position.x and y == position.y:
		return
	var scn = scene.instance()
	scn.position = Vector2(x,y)
	add_child(scn)
