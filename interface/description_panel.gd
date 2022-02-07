extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _inic(text):
	$desc.text = text
	visible = true
func _turn_off():
	visible = false
onready var c = get_tree().get_current_scene().find_node("Camera")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not visible:
		return
	var p = get_viewport().size
	var m =get_viewport().get_mouse_position() - p/2
	
	
	
	m.x *= c.zoom.x
	m.y *= c.zoom.y
	
	self.rect_position = m + Vector2(-200,10)
