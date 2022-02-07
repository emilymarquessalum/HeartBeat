extends GridContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var item_class = preload("res://items/item.tscn")
# Called when the node enters the scene tree for the first time.

func _ready():
		pass # Replace with function body.
var script_updates = []
func _add_item(item,c = true):
	if c:
		Main.items.append(item)
	var new_item = item_class.instance()
	add_child(new_item)
	item.name = tr(item.name)
	item.description =tr(item.description)
	new_item._inic(item.item_image,item.name, item.description)
	
	
	if item.item_script!=null:
		
		var script = item.item_script.new()
		script_updates.append(script)
		script._start_behaviour(self)
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for upd in script_updates:
		upd._update(self)
	pass
