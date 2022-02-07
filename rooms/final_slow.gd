extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
onready var s = get_tree().get_current_scene().find_node("slow_area")
var r = false
onready var p = get_tree().get_current_scene().find_node("Player")
# Called every frame. 'delta' is the elapsed time since the previous frame.
onready var init_speed = p.speed
func _process(delta):
	if overlaps_body(p) and not r:
		s.get_parent().remove_child(s)
		get_parent().remove_child(self)
		p.speed = init_speed-4
		p.speed_boosts.erase("slow_area")
		r=true
	pass
