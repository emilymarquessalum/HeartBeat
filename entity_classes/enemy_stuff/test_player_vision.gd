extends behaviour


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

onready var en = get_parent().get_parent()
onready var visible_area = en.find_node("visible_area")
onready var vision_cast = en.find_node("vision_cast")
onready var player = get_tree().get_current_scene().find_node("Player")

func _update(delta, control):
	if visible_area.overlaps_body(player):
	
		
		var new_pos = player.global_position - vision_cast.global_position
		vision_cast.cast_to = new_pos/2
		vision_cast.cast_to.x *= -en._get_direction()
		vision_cast.force_raycast_update()
		if not vision_cast.is_colliding():
			control._change_state("follow_player")
			
			en.do_action("following")
		else:
			en.do_action("moving")
			control._change_state("normal")			
	else:
		en.do_action("moving")
		control._change_state("normal")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
