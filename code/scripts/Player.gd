extends KinematicBody2D

export (int) var speed = 300
export (int) var jump_speed = -700
export (int) var gravity = 2000
onready var sprite = $AnimatedSprite
onready var gameobject = get_node("/root/Gameobject")
var velocity = Vector2.ZERO

func get_input():
	velocity.x = 0
	if Input.is_action_pressed("move_right"):
		velocity.x += speed
		sprite.flip_h = false
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
		sprite.flip_h = true

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_just_pressed("move_jump"):
		if is_on_floor():
			velocity.y = jump_speed
