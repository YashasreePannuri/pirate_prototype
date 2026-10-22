extends Node2D

@onready var item_icon = $item_icon
@onready var inv: Node2D = $"../../Inventory"

@onready var hand: Node2D = $"../../../Hand"


var slot_num: Vector2i
var item: Dictionary
var item_count = 0

func add_item(new_item):
	if (item_count != 0 and (item['name'] == new_item['name']) and item_count < item['stack_amnt']) or item == {}:
		item_count +=1
		item = new_item
		item_icon.texture = item["inv_icon"]
		return true
		
	return false

func _on_button_pressed():
	if hand and hand.item == {} and item != {}:
		inv.remove_item(slot_num)
