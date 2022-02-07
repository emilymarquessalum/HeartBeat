extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

onready var p = get_tree().get_current_scene().find_node("Player")
onready var speaker = get_tree().get_current_scene().find_node("speaker")

# Called every frame. 'delta' is the elapsed time since the previous frame.
var f = true
func _process(delta):
	if overlaps_body(p) and f:
		f = false
		speaker._transmit_message("no_need")
	pass
