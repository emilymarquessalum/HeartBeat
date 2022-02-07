extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var panel
func _ready():
	panel = StyleBoxTexture.new()
	$Panel.set("custom_styles/panel",panel)

func _change_texture(t):
	panel.texture =t
	$Panel.update()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
