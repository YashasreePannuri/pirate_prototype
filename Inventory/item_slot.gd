extends Node2D

@onready var item_icon = $item_icon

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
func _process(delta: float) -> void:
	pass
