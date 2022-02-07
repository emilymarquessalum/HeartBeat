extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	for n in transition_names:
		bs.append(p.find_node(n))
	pass # Replace with function body.

export(bool) var transition_mode = false
onready var p = get_parent()
export(Array, String) var transition_names = []
onready var bs = []
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if transition_mode:
		for b in bs:
			b.mouse_filter = 2
			if b.modulate.a8>0:
				b.modulate.a8-=3
				if b.modulate.a8<0:
					b.modulate.a8=0
	else:
		for b in bs:
			b.mouse_filter = 0
			if b.modulate.a8<255:
				b.modulate.a8+=3
				if b.modulate.a8>255:
				
					b.modulate.a8=255
