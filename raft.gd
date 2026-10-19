extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

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
