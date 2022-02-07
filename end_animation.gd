extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


onready var player = get_tree().get_current_scene().find_node("Player")
onready var camera = get_tree().get_current_scene().find_node("Camera")
 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for g in get_overlapping_bodies():
		if g == player:
			get_parent().remove_child(self)
			Main._spawn_rooms()
			camera.zooming = true
			return
