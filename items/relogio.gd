extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _update(t):
	pass

var player
func _start_behaviour(t):
	player = t.get_tree().get_current_scene().find_node("Player")
	player._get_behaviour("beat").connect("has_done_action",self, "give_boost")

func give_boost():
	player.speed_boosts["relogio"] = {'boost':3, 'time':2	}
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
