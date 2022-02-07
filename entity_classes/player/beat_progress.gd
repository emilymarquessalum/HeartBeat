extends ProgressBar


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var player
# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_tree().get_current_scene().find_node("Player")
	timer = player.time_to_end	
	max_timer = timer
	player._get_behaviour("beat").connect("has_done_action",self,"_hearth_beat")
	pass # Replace with function body.

func _hearth_beat():
	timer = max_timer 

var timer = 30
var max_timer
func _process(delta):
	timer -= delta
	self.value = (timer*100) / max_timer
	
	if self.value == 0 and player:
		player.end_game()
