extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	var raft = get_tree().get_first_node_in_group("raft")
	if body == raft:
		raft.current_island = self
		raft.nearIsland = true
		raft.exit_hint_label.show()


func _on_area_2d_body_exited(body: Node2D) -> void:
	var raft = get_tree().get_first_node_in_group("raft")
	if body == raft:
		raft.current_island = null
		raft.nearIsland = false
		raft.exit_hint_label.hide()
