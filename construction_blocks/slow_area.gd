extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

onready var player = get_tree().get_current_scene().find_node("Player")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if overlaps_body(player):
		player.speed_boosts["slow_area"] = {'boost':-3, 'time':0.1}
