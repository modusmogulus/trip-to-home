extends KinematicBody2D

export (int) var speed = 300
export (int) var jump_speed = -900
export (int) var gravity = 2000
onready var sprite = $AnimatedSprite
onready var jumpsfx = $jumpsfx
onready var gameobject = get_node("/root/Gameobject")
var velocity = Vector2.ZERO
var execute_this_code: bool = true
var onground = false
var magnetmove = false
var nearestmagnet = null
	
	
func get_input():
	velocity.x = 0
	if Input.is_action_pressed("move_right"):
		velocity.x += speed
		sprite.flip_h = false
		$AnimatedSprite.play("sprint")
	elif Input.is_action_pressed("move_left"):
		$AnimatedSprite.play("sprint")
		velocity.x -= speed
		sprite.flip_h = true
	else:
		if onground:
			$AnimatedSprite.play("idle")
		
func _physics_process(delta):
	print(str($jumptimer.wait_time) + str(onground) + str(is_on_floor()))
	if is_on_floor() == true:
		#$AnimatedSprite.play("Idle")
		$jumptimer.wait_time = 0.1
		onground = true
		
	if is_on_floor() == false && onground == true:
		onground = false
		#$AnimatedSprite.play("Idle")
		$jumptimer.start()
	

		
	get_input()

	
	if magnetmove == true:
		velocity = position.move_toward(nearestmagnet.position, delta * 1000.0)
	else:
		velocity.y += gravity * delta
		velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_just_pressed("move_jump"):
		if onground:
			velocity.y = jump_speed + (position.y / 4)
			jumpsfx.play()
			$AnimatedSprite.play("jump")
			
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




func _on_PlayerArea_area_entered(area):
	if area.name == "Magnet":
		magnetmove = true
		nearestmagnet = area


func _on_PlayerArea_area_exited(area):
	if area.name == "Magnet":
		magnetmove = false
