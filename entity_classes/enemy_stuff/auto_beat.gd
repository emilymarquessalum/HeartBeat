extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var contr
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var beat_frames = 0
func _update(delt,control):
	contr =  control
	beat_frames+=delt
	if beat_frames>=2:
		beat_frames=0
		control._set_size(control.initial_size*115/100)
		t = Timer.new()
		t.connect("timeout",self,"t")
		control.add_child(t)
		t.start(0.1)


var t
func t():
	var control = contr
	control._set_size(control.initial_size)
	if control.velocity.y >=0 and control.is_on_floor():
		control.velocity.y+=300
	control.remove_child(t)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
