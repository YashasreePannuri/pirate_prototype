extends CharacterBody2D

@onready var raft_image: Sprite2D = $RaftImage
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var enter_hint_label: Label = $Label
@export var speed = 200

var activePlayer = false # Represents whether player is in raft or not- starts false

# Called when the node enters the scene tree for the first time.
func _ready():
	enter_hint_label.visible = false
	
func _input(event):
	if event.is_action_pressed("interaction") && enter_hint_label.visible:
		_control_raft()
	elif activePlayer && event.is_action_pressed("interaction"):
		_leave_raft()

func _control_raft():
	var player = get_tree().get_first_node_in_group("player")
	activePlayer = true
	$Camera2.make_current()
	player.queue_free() # Delete the player - now we are the raft
	
func _leave_raft():
	var player = preload("res://Player.tscn").instantiate() # Bring the player back
	activePlayer = false
	get_tree().current_scene.add_child(player) # Add the player back
	player.global_position = global_position # Change the players' position to the rafts


func _physics_process(delta):
	if not activePlayer: return
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * speed

	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == get_tree().get_first_node_in_group("player"):
		enter_hint_label.show()


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body == get_tree().get_first_node_in_group("player"):
		enter_hint_label.hide()
