 extends behaviour


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(float)var speed_boost = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _start_behaviour():
	pass
	
	
	
func _update(delta, en):
	var ground_detect =en.find_node("front_ground_detector")
	
	var will_fall = not (ground_detect.is_colliding()) and en.is_on_floor() 
	
	var behind_detect = en.find_node("behind_detector")
	#var behind_tile = behind_detect.is_colliding()
	var behind_tile = false
	var in_front = en.find_node("direction_collision")
	
	var low_in_front =en.find_node("low_direction_collision").is_colliding()
	if (will_fall or low_in_front or in_front.is_colliding()) and  not behind_tile:
		en.change_direction()
	en.velocity.x = en.speed * en._get_direction() * speed_boost
	
	



