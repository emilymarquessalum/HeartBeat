extends Entity


# Declare member variables here. Examples:
# var a = 2
# var b = "text"               
signal touched_enemy(enemy, player)
var ignore_damage = false
# Called when the node enters the scene tree for the first time.
func _ready():
	_start_sizes([$CollisionShape2D,$area])
	
	act_size = initial_size.x - initial_size.x*size_percentage/100
	tick_down = (act_size /time_to_end)/8
	
	health_control.connect("died",self,"end_game")
	health_control.connect("life_damaged",self,"took_hit")
	pass # Replace with function body.
var jump = 2
var jump_max = 2




func took_hit(c):
	$damage_sound.play()
	health_control.definitive_can_take_damage = false
	$InvulnerableTimer.start(2)

func end_game():
	if not die: return
	get_tree().change_scene("res://interface/game_over.tscn")

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if abs(size_changes[0].scale.x) <= act_size:
		_set_size(Vector2.ZERO)
		
		end_game()
		
	var cols = $area.get_overlapping_bodies()
	velocity.x -= velocity.x/10
	if abs(velocity.x) <= 0.1:
		velocity.x = 0
	for c in cols:
		if c.is_in_group("Enemy"):
			emit_signal("touched_enemy", c, self)
			if ignore_damage:
				ignore_damage = false
				continue
			if health_control._take_damage(1):			
				var d = c._get_direction_from(self)
				velocity+= Vector2((800)*-d,-150)
			break
	if not has_done_action:
		do_action("idle")
	has_done_action = false
	
	 

export(float) var time_to_end = 10
export(float) var size_percentage = 10
onready var act_size 
onready var tick_down
