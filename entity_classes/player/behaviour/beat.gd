extends behaviour


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var clicks_in_row = 0
export(int) var clicks_to_explode = 5
export(int) var time_clicks = 1



var frames = 0

onready var transmit = get_tree().get_current_scene().find_node("speaker")
onready var excess_progress = get_tree().get_current_scene().find_node("excess_progress")
var first_damage = true
func _update(delta, player):
	
	
	
	if clicks_in_row>0:
		clicks_in_row-=delta/time_clicks
	excess_progress.value = clicks_in_row*100/clicks_to_explode
	if clicks_in_row >= clicks_to_explode:
		if first_damage:
			transmit._transmit_message("fast_beat")
			first_damage = false
		player.health_control._take_damage(1)
		clicks_in_row = 0
	if Input.is_action_just_released("beat"):
		_beat()
		
func _beat():
	
	clicks_in_row += 1
	var player = control

	control.get_node("beat_sound").play()
	if control.velocity.y >=0 and control.is_on_floor():
		control.velocity.y+=300
	player._set_size(player.initial_size*115/100)
	t = Timer.new()
	t.connect("timeout",self,"t")
	player.add_child(t)
	t.start(0.1)
	
	emit_signal("has_done_action")
		
var b_range = 1


				
var t
func t():
	control._set_size(control.initial_size)
	if control.velocity.y >=0 and control.is_on_floor():
		control.velocity.y+=300
	control.remove_child(t)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
