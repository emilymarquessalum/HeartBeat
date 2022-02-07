extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _start_behaviour(t):
	var player = t.get_tree().get_current_scene().find_node("Player")
	player.connect("touched_enemy", self, "_attempt_to_attack")
	

func _attempt_to_attack(enemy,player):
	
	var top = enemy.get_node("top")
	if top.global_position.y >= player.global_position.y:
		player.ignore_damage = true
		enemy.get_parent().remove_child(enemy)

func _update(t):
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
