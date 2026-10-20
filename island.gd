extends Node2D
#
#@export var player:CharacterBody2D
#@export var player_pos:Vector2
#@export var raft:CharacterBody2D
#@export var raft_pos:Vector2
#
## Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass 
	
func _process(_delta: float) -> void:
	pass
#func _physics_process(delta: float) -> void:
	#player_pos = player.global_position
	#if not $Area2D.overlaps_body(player):
		#raft_pos = player_pos

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
