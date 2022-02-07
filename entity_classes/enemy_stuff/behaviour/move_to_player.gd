extends behaviour


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(float)var speed_boost = 1

# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.
onready var player = get_tree().get_current_scene().find_node("Player")
onready var en = get_parent().get_parent()

func _update(delta, control):
	
	var pos = player.global_position - en.global_position
	en._look_at(player.global_position,true)
	var dir = 1 if pos.x > 0 else -1
	
	en.velocity.x = en.speed * dir * speed_boost
	
	var dir_detect = en.get_node("direction_collision")
	if (pos.y < -25 or dir_detect.is_colliding()) and en.is_on_floor():
		en.velocity.y = -330
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
