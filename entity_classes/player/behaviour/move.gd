extends behaviour


# Declare member variables here. Examples:
# var a = 2


# Called when the node enters the scene tree for the first time.
func _start_behaviour():
	get_parent().get_parent().connect("changed_state", self, "_stop_moving", [], CONNECT_ONESHOT)
	pass # Replace with function body.

func _update(delta,player): 	
	if Input.is_action_pressed("left"):
		_move_to(player,-1,delta)
	elif Input.is_action_pressed("right"):
		_move_to(player,1,delta)

var moving=false
func _move_to(player,dir,delta):
	moving=true
	
	player.position.x += player.speed * dir
	player.do_action("walking")
	player.has_done_action = true
	if player.flip == (dir < 0):
		var sprite = player.find_node("Anim")
		sprite.scale.x = -sprite.scale.x
		player.flip = !player.flip
		#player.tick_down *= -1
