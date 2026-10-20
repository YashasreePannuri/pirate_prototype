extends Node2D

const ITEM_SLOT = preload("res://Inventory/item_slot.tscn")


var row_size = 1
var col_size = 2
var items = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for x in range(row_size):
		items.append([])
		
		for y in range(col_size):
			items[x].append([])
			
			var instance = ITEM_SLOT.instantiate()
			instance.global_position = Vector2(x*50,y*50)
			instance.slot_num = Vector2i(x,y)
			add_child(instance)
			items[x][y] = instance
			
	
	items[0][0] = "fuckkk"
	print(items)

func prep_item(new_item):
	var item = {}
	
	item['name'] = new_item.item_res.name
	item['inv_icon'] = new_item.item_res.inv_icon
	item['item_path'] = new_item.item_res.item_path
	item['stack_amnt'] = new_item.item_res.stack_amnt
	
	return item
	
func add_item(item):
	for y in range(col_size):
		for x in range(row_size):
			var slot = items[x][y]
			
			if slot.add_item(item):
				return true
				
	return false
		
