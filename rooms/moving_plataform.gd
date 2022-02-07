
extends Node2D

export(bool) var ignore_x = false
export(bool) var ignore_y = false

onready var p = get_tree().get_current_scene().find_node("Player")

func _reset():
	self.global_position = point_a

func _ready():
	Main._reseters.append(self)
	p._get_behaviour("beat").connect("has_done_action",self,"turn_on")
	pass # Replace with function body.

var tile_off = preload("res://resources/plataforma.png")

var tile_on = preload("res://resources/plataforma_ligada.png")

func turn_on():
	if $area.overlaps_body(p):
		for t in $tiles.get_children():
			t.get_node("sprite").texture = tile_on
		on = true
		speed=2
var speed = 2
onready var current_path = get_node("point_b").global_position
onready var next_path = get_node("point_a").global_position
onready var point_a = next_path
var on = false
func _process(delta):
	
	if not on:
		return
	speed -= delta
	if speed <= 0:
		_turn_off()
		speed=0
		return
	var p = current_path
	var x_done = false
		
	if not ignore_x:
		var m_t = move_toward(global_position.x, p.x, speed)
		global_position.x = m_t
		x_done=abs(global_position.x - p.x) < 5 
	
	
	if x_done or ignore_x:
		var d = current_path
		current_path = next_path
		next_path = d
		_turn_off()
func _turn_off():
	on = false
	for t in $tiles.get_children():
		t.get_node("sprite").texture = tile_off
