extends OptionButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
		
	
	
	
	
	pass # Replace with function body.
var begin = true

# easiest way to make a "late" ready
func _process(delta):
	if not begin:
		return
	begin = false
	var id = 0
	var cur_locale = TranslationServer.get_locale()
	for locale in TranslationServer.get_loaded_locales():
		var locale_name = TranslationServer.get_locale_name(locale)
		add_item(locale_name)
		set_item_metadata(id, locale)
		if cur_locale == locale:
			selected = id
		id+=1



	pass # Replace with function body.

func _on_language_option_item_selected(index):
	TranslationServer.set_locale(get_selected_metadata())
	Main.emit_signal('language_changed',get_item_text(index))
