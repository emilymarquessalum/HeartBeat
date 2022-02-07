extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var zooming = false
var inic = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

onready var background = get_tree().get_current_scene().find_node("background")
onready var player = get_tree().get_current_scene().find_node("Player")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	if not inic:
		if player.is_on_floor():
			inic = true
			global_position.y = player.global_position.y
	
	if zooming:
		zoom.x += delta
		zoom.y += delta
		background.scale.x +=delta*2
		background.scale.y +=delta*2
		
	global_position.x = player.global_position.x
	if player.velocity.y != 0:
		global_position.y = player.global_position.y
	
func _update():
	global_position.y = player.global_position.y
	
