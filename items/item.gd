extends Panel

var style
var description
var item_name
var desc_class = preload("res://interface/description_panel.tscn")
onready var desc = get_tree().get_current_scene().find_node("Camera").get_node("desc")
	
func _ready():
	style = StyleBoxTexture.new()
	set("custom_styles/panel",style)
	
func _inic(sprite,_name, descript):
	description = descript
	style.texture = sprite
	item_name = _name
	
func _on_Panel_mouse_entered():
	desc._inic(item_name + ":\n"+description)
	
func _on_Panel_mouse_exited():
	desc._turn_off()
	

