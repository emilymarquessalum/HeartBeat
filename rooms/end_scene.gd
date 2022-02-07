extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var player = get_tree().get_current_scene().find_node("Player")
# Called when the node enters the scene tree for the first time.
func _ready():
	player._get_behaviour("beat").connect("has_done_action",self,
	"_instance_timer")
	player.alive = false
	$speaker._transmit_message("all_gone")
	pass # Replace with function body.

var countdown = 5
var c_scene = preload("res://rooms/countdown.tscn")
func _instance_timer():
	var c = c_scene.instance()
	$text_spawn.add_child(c)
	c.text = String(countdown)
	if countdown==0:
		$speaker._transmit_message("cicle_end")
		$speaker.connect("finished_transmition",self,"end_game")
		
		player.get_parent().remove_child(player)
		player = null
	countdown-=1
var f = 0
var black_screen = false
func end_game():
	black_screen=true

func _process(delta):
	if black_screen:
		$blackness.modulate.a8 += 2
		if $blackness.modulate.a8>=255:
			$blackness.modulate.a8=255
			black_screen=false
			Main.spawn_point = 1
			Main.items = []
			Main._start_level()
			
	if player == null:
		return
	f +=delta
	if f < 2:
		return
	f = 0
	player._get_behaviour("beat")._beat()
