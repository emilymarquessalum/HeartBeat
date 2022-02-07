extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


onready var p = get_tree().get_current_scene().find_node("Player")
onready var jump = p._get_behaviour("jump")
var boosts = 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $area.overlaps_body(p):
		p.velocity.y -= 250
		
	pass
