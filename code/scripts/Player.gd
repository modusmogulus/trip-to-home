extends KinematicBody2D

export (int) var speed = 300
export (int) var jump_speed = -700
export (int) var gravity = 2000
onready var sprite = $AnimatedSprite
onready var gameobject = get_node("/root/Gameobject")
var velocity = Vector2.ZERO
var execute_this_code: bool = true

# true during jump that is activated with space-bar
var on_air: bool = false 

func get_input():
	velocity.x = 0
	if Input.is_action_pressed("move_right"):
		velocity.x += speed
		sprite.flip_h = false
		sprite.animation = "sprint"
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
		sprite.flip_h = true
		sprite.animation = "sprint"

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_just_pressed("move_jump"):
		# we jumped so we are in the air
		on_air = true
		sprite.animation = "jump"
		
		if is_on_floor():
			velocity.y = jump_speed
			on_air = false # we are not in air anymore
			sprite.animation = "idle"
			
#enemy, hp etc
func bounce():
	velocity.y = jump_speed * 1

func ouch(var enemyposx):
	if execute_this_code:
		Global.lose_life()
		set_modulate(Color(0.9,0.3,0.3,0.6))
		velocity.y = jump_speed * 1
		execute_this_code = false
		
		if position.x < enemyposx:
			velocity.x = -800
		elif  position.x > enemyposx:
			velocity.x = 800
		Input.action_release("left")
		Input.action_release(" right")
		$Timer.start()

func _on_Timer_timeout():
	set_modulate(Color(1,1,1,1))
	execute_this_code = true
