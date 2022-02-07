tool
extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
 
# Called when the node enters the scene tree for the first time.
func _ready(): 

	 
	scale_to_screen()
	pass # Replace with function body.


func scale_to_screen():
	var viewportWidth = get_viewport().size.x
	var viewportHeight = get_viewport().size.y
	var scale = viewportWidth / texture.get_size().x

	 
	set_scale(Vector2(scale/1.5, scale/1.5))

var update_frames = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	update_frames +=1
	if update_frames < 60:
		return
	
	update_frames = 0
	
	scale_to_screen()
	 
