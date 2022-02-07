extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(String) var path
onready var transmit = find_node("speaker")
# Called when the node enters the scene tree for the first time.
func _ready():
	Main.current_scene = path
	var p =find_node("Player")
	var sp = find_node("spawn_point_"+String(Main.spawn_point)) 
	
	p.global_position = sp.global_position
	find_node("background").texture = Main.background_image
	if Main.spawn_point == 1:
		transmit._transmit_message("journey_start")
		transmit.connect("finished_transmition",self,"spacebar",[],CONNECT_ONESHOT)

func spacebar():
	transmit._transmit_message("beat_tutorial")
	transmit.connect("finished_transmition",self,"next_message",[],CONNECT_ONESHOT)

func next_message():
	transmit._transmit_message("fast_beat_tutorial")
	
