extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Main.connect("language_changed", self, "change_message")
	pass # Replace with function body.
	

func change_message(new_l):
	$Label.text = tr(code)	

signal finished_transmition()
var transmition = false
var opening = false
var code 
func _transmit_message(message):
	
	code = message
	message =TranslationServer.translate(message)
	if message.dedent().to_lower() == "ignore":
		return
	$Label.text = message
	timer = 2
	opening = true

var timer = 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if opening:
		modulate.a8 += 2
		if modulate.a8 >= 255:
			modulate.a8 = 255
			opening = false
			transmition = true
			
	if transmition:
		timer -= delta
		if timer <=0:
			modulate.a8-=2
			if modulate.a8 <= 0:
				modulate.a8 = 0
				transmition = false
				emit_signal("finished_transmition")
