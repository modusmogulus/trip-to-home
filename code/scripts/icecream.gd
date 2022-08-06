extends Node2D



signal coin_collected
onready var timer = $Timer
export var time_left = 60
onready var label = $Control/Label
onready var gameobject = get_node("/root/Gameobject")
onready var sfx = $sfx
onready var sprite = $AnimatedSprite
onready var collider = $Area2D/CollisionShape2D

func _ready():
	gameobject.ice_creams_left += 1
	timer.wait_time = time_left
	
func _process(delta):
	if timer.time_left != null:
		time_left = timer.time_left
		label.text = str(ceil(timer.time_left))

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		gameobject.ice_creams_left -= 1
		gameobject.ice_creams_eaten += 1
		sprite.visible = false
		collider.disabled = true
		sfx.play()
		emit_signal("coin_collected")

func _on_sfx_finished():
	queue_free() #this is because if we free the queue immdiately after playing a sound then it wont play


func _on_Timer_timeout():
	gameobject.ice_creams_melted += 1
	queue_free()


func _on_VisibilityNotifier2D_screen_entered():
	timer.start()
