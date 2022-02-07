extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$anim.play("count")
	$anim.connect("animation_finished",self,"_finished_countdown")

signal finished_countdown()

func _finished_countdown(c):
	get_parent().remove_child(self)
	emit_signal("finished_countdown")
