extends KinematicBody2D

onready var gameobject = get_node("/root/Gameobject")
var speed = 50
var velocity = Vector2()
export var direction = -1
export var detects_cliffs = true

func _ready():
	# for example "rat:[KinematicBody2D:1548]"

	var name = str(get_node_and_resource(".")[0])
	if "worm" in name:
		$AnimatedSprite.play("worm-walk")
	else:
		$AnimatedSprite.play("walk")
			
	if direction == 1:
		$AnimatedSprite.flip_h = false
	$floorchecker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	$floorchecker.enabled = detects_cliffs
	if direction == 0:
		$AnimatedSprite.flip_h = true
		
func _physics_process(delta):
	
	if is_on_wall() or not $floorchecker.is_colliding() and detects_cliffs and is_on_floor():
		direction = direction * -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		$floorchecker.position.x = $CollisionShape2D.shape.get_extents().x * direction
		
	velocity.y += 20
	
	velocity.x = speed * direction
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
	


func _on_topchecker_body_entered(body):
		if body.collision_layer == 1:
			gameobject.camera.shake(0.3, 3.0)
			speed = 0
			#$soundstomp.play()
			set_collision_layer_bit(4, false)
			set_collision_mask_bit(1, false)
			$sidechecker.set_collision_layer_bit(4, false)
			$sidechecker.set_collision_mask_bit(1, false)
			$topchecker.set_collision_layer_bit(4, false)
			$topchecker.set_collision_mask_bit(1, false)
			#$AnimatedSprite.play("squish") 
			$timer.start()
			body.bounce()

func _on_sidechecker_body_entered(body):
	#if speed == 0:
		#pass
	if body is KinematicBody2D:
		body.ouch(position.x)
		#$soundhurt.play()

func _on_timer_timeout():
	queue_free()
