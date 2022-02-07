extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

onready var player = get_parent().get_parent()
# Called every frame. 'delta' is the elapsed time since the previous frame.
var pframes = 0
func _process(delta):
	if player.health_control.definitive_can_take_damage:
		pframes = 0
		visible = true
		return
	
	pframes += delta
	if pframes >= 0.1:
		pframes = 0
		visible = !visible
