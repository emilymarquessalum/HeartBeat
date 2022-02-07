
extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var f = 0
var dir = -1
onready var player = get_tree().get_current_scene().find_node("Player")
# Called every frame. 'delta' is the elapsed time since the previous frame.
var taken = false
var taken_sound = preload("res://sounds/pegar_vida.wav")
func _test_player_collision():
	if not overlaps_body(player): return
	if player.health_control._is_full(): return
	player.health_control._heal_health(1)
	$AnimationPlayer.play("heart")
	taken = true
	var s = AudioStreamPlayer2D.new()
	s.stream = taken_sound
	get_tree().get_current_scene().add_child(s)
	s.global_position = global_position
	s.play()
	$AnimationPlayer.connect("animation_finished",self,"_end")

func _end():
	get_parent().remove_child(self)
	
func _process(delta):
	if taken:
		position.y -= 1
		
		return
	_test_player_collision()
	position.y += 0.4 * dir
	f +=1
	if f > 30:
		f = 0
		dir = -1 if dir ==1 else 1
