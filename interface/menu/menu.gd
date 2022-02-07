extends Control

func _ready():
	TranslationServer.set_locale("pt")
	Main.connect("language_changed",self,"change_interface_language")
	Main.emit_signal("language_changed","pt")
func change_interface_language(new_language):
	$return_to_menu.text = TranslationServer.translate("return")
	pass
func _on_exit_game_pressed():
	get_tree().quit()


func _on_new_game_pressed():
	Main._reset_save()
	Main._start_level()


func _on_options_pressed():
	
	$main_menu.transition_mode = true
	$options_menu.transition_mode = false
	$general_options._open()
	pass # Replace with function body.


func _on_return_to_menu_pressed():
	
	$main_menu.transition_mode = false
	$options_menu.transition_mode = true
	pass # Replace with function body.






func _on_continue_game_pressed():
	Main._load_save()
	Main._start_level()
