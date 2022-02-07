extends Node


export(int) var max_health = 3
export(bool) var ignore_damage = false
var health = max_health
signal life_altered(health)
signal life_damaged(health_control)
signal life_healed(health_control)
signal died()
func _ready():
	health = max_health
	emit_signal("life_altered", health)
	pass # Replace with function body.

var can_take_damage = true
var definitive_can_take_damage = true
var damage_taken

func _is_full():
	return health == max_health

func _life_after_damage_is_taken():

	return health - damage_taken

func _take_damage(damage):
	if ignore_damage:
		return false
	if health <= 0:
		return false
		
	if not definitive_can_take_damage:
		return false
	
	damage_taken = damage
	emit_signal("life_damaged",self)
	health -= damage
	emit_signal("life_altered", health)
	if health <= 0:
		emit_signal("died")
	return true
func _get_health():
	return health
		
func _set_health(v):
	if v == null:
		return
	health = v
	emit_signal("life_altered", health)
		
var can_heal = true
var definitive_can_heal = true
func _heal_health(heal):

	if not can_heal:
		can_heal = definitive_can_heal
		return
	health += heal
	if health >= max_health:
		health = max_health
	
	emit_signal("life_altered", health)
	emit_signal("life_healed",self)
	

func _process(delta):
	pass
#	pass
