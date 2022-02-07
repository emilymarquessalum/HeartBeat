extends KinematicBody2D
class_name Entity

		  
export(bool) var die = true
var flip = false
export(bool) var alive = true
export(int) var speed = 10 setget , _get_speed
export(int) var jump_speed = -100 setget , _get_jump_speed

onready var health_control = find_node("Health")
signal changed_direction()

onready var current_state
export(String) var starting_state
# Called when the node enters the scene tree for the first time.
var spd = null
var speed_boosts = {}
func _get_speed():
	if spd: return spd
	spd = speed
	for b in speed_boosts:
		spd += speed_boosts[b]["boost"]
	return spd
	
var jump_spd = null
var jump_boosts = {}
func _get_jump_speed():
	if jump_spd: return jump_spd
	return _update_jump_speed()

func _update_jump_speed():
	var to_remove = []
	jump_spd = jump_speed
	for b in jump_boosts:
		var bs = jump_boosts[b]
		jump_spd += bs["boost"]
		if bs.has("times"):
			bs["times"] -= 1
			if bs["times"] <= 0:
				to_remove.append(b)
	for k in to_remove:
		jump_boosts.erase(k)
	return jump_spd

onready var initial_size
func _ready(): 
	 
	_change_state(starting_state)
	health_control.connect("died", self, "not_alive")
	var updt = get_node("on_update")
	
	if not updt:
		return
	
	for act in updt.get_children():
		behaviours.append(act)
	
	pass # Replace with function body.



var has_done_action = false
func _update_has_done_action(s):
	if has_done_action:
		return
		
	has_done_action = s
func do_action(action):
	find_node("Anim").play(action)
signal changed_state(c)
func _change_state(state, data = null):
	state = find_node("states").get_node(state)
	emit_signal("changed_state", self)
	current_state = state
	current_state._start_state(data)

func _get_behaviour(beh_name):
	var beh = find_node("behaviours").get_node(beh_name)
	return beh
	

func not_alive():
	alive = false

func _look_at(location, flip_mode):
	if flip_mode:
		if location.x>  global_position.x and !flip:
			change_direction()

		if location.x< global_position.x and flip:
			change_direction()
		return
	if location.x> global_position.x and flip:
		change_direction()
	elif location.x< global_position.x and !flip:
		change_direction()
	
func change_direction():
	flip = !flip
	scale.x = -scale.x
	emit_signal("changed_direction")
	
func _get_direction():
	return 1 if flip else -1

func _get_direction_from(p):
	if global_position.x > p.global_position.x:
		return 1
	return -1	
	
func _start_sizes(f):
	size_changes = f
	initial_size = f[0].scale
		
var size_changes 


func _update_size(add_size):
	for s in size_changes:
		s.scale.x += add_size.x
		s.scale.y += add_size.y
		
func _set_size(new_size):
	for s in size_changes:
		s.scale.x = new_size.x
		s.scale.y = new_size.y

export(int) var GRAVITY = 10
var velocity = Vector2.ZERO
	
var behaviours = []	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	for beh in behaviours:
		beh._update(delta,self)
	if not alive and die:
		return
	spd = null
	jump_spd = null
	var to_remove = []
	for k in speed_boosts.keys():
		var b = speed_boosts[k]
		if b.has("time"):
			b["time"] -= delta
			if b["time"] <= 0:
				to_remove.append(k)
	for k in to_remove:
		speed_boosts.erase(k)
		
	var to_remove_j = []
	for k in jump_boosts.keys():
		var b = jump_boosts[k]
		if b.has("time"):
			b["time"] -= delta
			if b["time"] <= 0:
				to_remove_j.append(k)
	for k in to_remove_j:
		jump_boosts.erase(k)
	
	current_state._state_behaviour(delta)
	velocity.y+= GRAVITY 
	velocity = move_and_slide(velocity, Vector2.UP)
	
