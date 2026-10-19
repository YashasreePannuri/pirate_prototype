extends Node2D

@export var player:CharacterBody2D
@export var player_pos:Vector2
@export var raft_pos:Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	player_pos = player.global_position
	if not $Area2D.overlaps_body(player):
		raft_pos = player_pos
