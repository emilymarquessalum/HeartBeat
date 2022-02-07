extends Enemy


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	_start_sizes([$CollisionShape2D])
	pass # Replace with function body.

var tick_down = 0.01


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
