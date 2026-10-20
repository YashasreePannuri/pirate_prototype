extends TextureButton

@onready var player_2: CanvasLayer = $"../../Player2_Dialogue"
@onready var player: CanvasLayer = $"../../Player_Dialogue"


func _on_pressed() -> void:
	var dialogue: Array[String] = ["hello"]
	player.start_dialogue(dialogue)
	player_2.start_dialogue(dialogue)
