extends Node2D

@onready var item_icon = $Item_Icon

var can_drop = true

var item: Dictionary
var item_count = 0

func _physics_process(_delta):
	global_position = get_global_mouse_position()
	
func _input(event):
	if event.is_action_pressed("left_click"):
		if can_drop:
			drop_item()
	
func add_item(new_item,count):
	item = new_item
	item_count = count
	item_icon.texture = item['inv_icon']
	
func drop_item():
	if item != {}:
		for i in item_count:
			var instance = load(item['item_path']).instantiate()
			instance.global_position = get_global_mouse_position()
			$"../".add_child(instance)
		item_icon.texture = null
		item = {}
		item_count = 0
