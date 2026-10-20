extends Node2D

@onready var item_icon = $item_icon

# Since item_slot is a child of Inventory, the inventory is just the parent!
@onready var inv: Node2D = get_parent() 

# Go up twice (../) to reach Testing, then down into Hand
var hand: Node2D


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

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_button_pressed():
	if hand.item == {} and item != {}:
		inv.remove_item(slot_num)
