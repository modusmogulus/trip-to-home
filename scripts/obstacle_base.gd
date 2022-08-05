extends KinematicBody2D

export var speed_y = -2
export var speed_x = 0
export var x_limited = false
var screen_size

# Constant variables for state enum


var velocity = Vector2.ZERO 

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	
	velocity.y -= 1 * speed_y
	velocity.x -= 1 * speed_x

	position += velocity * delta

	if position.x > screen_size.x && x_limited == true:
		queue_free()
