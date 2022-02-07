extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

export(Resource) var img
export(int) var spawn_point_change = -1
onready var b = get_tree().get_current_scene().find_node("background")
onready var p = get_tree().get_current_scene().find_node("Player")
func _process(delta):
	if overlaps_body(p):
		b.texture = img
		if spawn_point_change != -1:
			Main.spawn_point = spawn_point_change
			Main.background_image = img
			Main._save_game()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
