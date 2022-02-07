extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Main.connect("language_changed",self,"change_language")
	change_language("")
	pass # Replace with function body.

func change_language(new_l):
	$Button.text = TranslationServer.translate("back_menu")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		_change_state()
func _change_state():
	visible = !visible
	get_tree().paused = visible
func _on_return_pressed():
	_change_state()
	$general_options._save_settings()
	pass # Replace with function body.


func _on_Button_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://menu/menu.tscn")
