tool
extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(bool) var floating = true
export(String) var item_name
export(int) var id
onready var description = tr(item_name +"_descript")
export(Resource) var item_script
export(Resource) var item_image
onready var transmit = get_tree().get_current_scene().find_node("speaker")
onready var player = get_tree().get_current_scene().find_node("Player")
onready var items = get_tree().get_current_scene().find_node("items")
var item_sound = preload("res://sounds/pegaritem.wav")
var f = 0
var dir = -1

func _ready():
	$Sprite.texture = item_image

func _process(delta):
	if Engine.editor_hint:
		$Sprite.texture = item_image
		return
	 
	
	if floating:
		position.y += 0.4 * dir
	f +=1
	if f > 30:
		f = 0
		dir = -1 if dir ==1 else 1
	
	if overlaps_body(player):
		var s = AudioStreamPlayer2D.new()
		s.stream = item_sound
		get_tree().get_current_scene().add_child(s)
		s.global_position = global_position
		s.play()
		items._add_item(self)
		transmit._transmit_message(item_name +"_message")
		get_parent().remove_child(self)
 
