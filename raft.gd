extends CharacterBody2D

@onready var raft_image: Sprite2D = $RaftImage
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var enter_hint_label: Label = $Label
@export var speed = 200
# Called when the node enters the scene tree for the first time.
func _ready():
	enter_hint_label.visible = false
	
func _input(event):
	if event.is_action_pressed("interaction") && event.is_pressed() && enter_hint_label.visible:
		_control_raft()
	elif activePlayer && event.is_action_pressed("interaction") && event.is_pressed():
		_leave_raft()

func _control_raft():
	var player = get_tree().get_first_node_in_group("player")
	activePlayer = true
	player.queue_free()
	
func _leave_raft():
	var player = preload("res://Player.tscn").instantiate()
	
	activePlayer = false
	get_tree().current_scene.add_child(player)
	player.global_position = global_position
	
var activePlayer = false


func _physics_process(delta):
	if not activePlayer: return
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * speed

	move_and_slide()


#@export var speed = 400
#@export var player:CharacterBody2D
#@export var player_pos:Vector2
#var screen_size
#
#func _ready():
	#screen_size = get_viewport_rect().size
#
#func _process(delta):
	#velocity = Vector2.ZERO # The player's movement vector.
	#if Input.is_action_pressed("move_right"):
		#velocity.x += 50
	#if Input.is_action_pressed("move_left"):
		#velocity.x -= 50
	#if Input.is_action_pressed("move_down"):
		#velocity.y += 50
	#if Input.is_action_pressed("move_up"):
		#velocity.y -= 50
		#
	#position += velocity * delta
	#position = position.clamp(Vector2.ZERO, screen_size)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == get_tree().get_first_node_in_group("player"):
		enter_hint_label.show()


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body == get_tree().get_first_node_in_group("player"):
		enter_hint_label.hide()
