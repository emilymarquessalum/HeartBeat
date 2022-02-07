extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _open():
	$volume.value = Main.volume
func _save_settings():
	var settings = {}
	settings["volume"] = $volume.value
	
	Main._save_options_settings(settings)
