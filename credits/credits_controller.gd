extends Control


var texts = ["Programação: Emily", "Arte: Greygor", "Sound: Greygor"]
var timer = 200
var credit_text = preload("res://credits/CreditText.tscn")
func _process(delta):
	if texts.size() == 0:
		return		
	timer += delta
	
	if timer > 5:
		timer = 0
		var new_text = credit_text.instance()
		new_text.rect_position.y= get_viewport().size.y
		get_tree().get_current_scene().add_child(new_text)
		new_text.text = texts.pop_front()
