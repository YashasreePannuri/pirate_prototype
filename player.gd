extends CharacterBody2D

@export var speed = 200
var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	add_to_group("player")
	$Camera.make_current()



func _physics_process(_delta):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * speed

	move_and_slide()
	
