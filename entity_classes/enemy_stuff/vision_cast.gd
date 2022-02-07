tool
extends RayCast2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass#get_parent().connect("changed_direction",self,"c")
	pass # Replace with function body.

func c():
	self.scale*=-1
