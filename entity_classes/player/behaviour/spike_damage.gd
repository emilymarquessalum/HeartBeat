extends behaviour


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var camera = get_tree().get_current_scene().find_node("Camera")
func _update(delta, control):
	var area = control.get_node("area")
	
	for c in area.get_overlapping_bodies():
		if c.is_in_group("Spikes"):
			control.health_control._take_damage(1)
			control.global_position = c.get_node("respawn").global_position
			camera._update()
			Main._reset()
			break
	
	
