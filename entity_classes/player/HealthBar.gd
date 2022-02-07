extends GridContainer

onready var filled_heart = preload("res://resources/vida.png")
onready var not_filled_heart = preload("res://resources/vida_sem.png")

var max_health = 0
var heart_tscn = preload("res://entity_classes/player/heart.tscn")
func _alterate_interface(health):
	
	for i in range(max_health):
		get_child(i)._change_texture(not_filled_heart)
	for i in range(health):
		get_child(i)._change_texture(filled_heart)
	
	

	
# Called when the node enters the scene tree for the first time.


func _start_interface(h):
	for i in range(h):
		var heart = heart_tscn.instance()
		add_child(heart)
	max_health = h	
	_alterate_interface(h)

var runned = false
func _process(delta):
	if not runned:
		runned = true
		var health_control =  get_tree().get_current_scene().find_node("Player").health_control
		health_control.connect("life_altered", self, "_alterate_interface")
		_start_interface(health_control.health)
	
