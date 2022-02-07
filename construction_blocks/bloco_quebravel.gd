extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var b_state = 0
var sp_1 = preload("res://resources/bloco_quebravel_quebrando.png")

onready var p = get_tree().get_current_scene().find_node("Player")

# Called when the node enters the scene tree for the first time.
func _ready():
	p._get_behaviour("beat").connect("has_done_action",self,"check_for_break")
	pass # Replace with function body.
var break_sound = preload("res://sounds/blocoquebrando.wav")
onready var collision = $CollisionShape2D
func _make_break_sound():
	var s = AudioStreamPlayer2D.new()
	s.stream = break_sound
	get_tree().get_current_scene().add_child(s)
	s.global_position = global_position
	s.play()
	
func _reset():
	add_child(collision)
	
	
func check_for_break():
	if $break_area.overlaps_body(p):
		
		_make_break_sound()
		if b_state==0:
			$CollisionShape2D/Sprite.texture = sp_1
			b_state+=1
		else:
			remove_child($CollisionShape2D)
			Main._reseters.append(self)
			
