extends Node
class_name state

func _ready():
	for s in used_behaviours:
		behaviours.append(behaviour.get_node(s))

export(bool) var update_has_done_action = false
onready var behaviour  = get_parent().get_parent().find_node("behaviours")
export(Array,String) var used_behaviours = []
onready var behaviours = []
onready var controller = get_parent().get_parent()
func _state_behaviour(delta):
	for b in behaviours:
		b._update(delta, controller)
	controller._update_has_done_action(update_has_done_action)
	
func _start_state(data):
	for b in behaviours:
		b._start_behaviour_main(data)
		
		
export(String) var state_name = "not named"
func get_name():
	return state_name
	
