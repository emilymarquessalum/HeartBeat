extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var frames = 0
func _update(delt,control):
	frames+=delt
	
	if frames<0.125:
		return
	frames = 0
	control._update_size(Vector2(-abs(control.tick_down),-control.tick_down))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
