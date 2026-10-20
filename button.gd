extends Button

@onready var player_2: CanvasLayer = $"../../Player2_Dialogue"
@onready var player: CanvasLayer = $"../../Player_Dialogue"


func _on_pressed() -> void:
	disabled = true
	release_focus()
	await dialogue()
	disabled = false
	

func dialogue():
	var dialogue1: Array[String] = ["hello"]
	var dialogue2: Array[String] = ["hello"]
	var dialogue3: Array[String] = ["I'm looking for someone who can fix a boat"]
	var dialogue4: Array[String] = ["I can help you with that","but I will need something in return... ","my daughter is sick and needs medicine find it for her"]
	player.start_dialogue(dialogue1)
	await player.dialogue_finished
	player_2.start_dialogue2(dialogue2)
	await player_2.dialogue_finished
	await get_tree().create_timer(0.1).timeout
	player.start_dialogue(dialogue3)
	await player.dialogue_finished
	player_2.start_dialogue2(dialogue4)
	await player_2.dialogue_finished
