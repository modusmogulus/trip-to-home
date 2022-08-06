extends CanvasLayer

export var bankaccount = 1
var coins = 0

func _ready():
	$Coins.text = String(coins)
	load_hearts()
	Global.hud = self
	
	
func _physics_process(delta):
	if Global.lives <= 0:
		print("last life")
		$AnimationPlayer.play("retry")
		$RandomAudioStreamPlayer.play()	
	if coins == 1:
		coins = 93
		load_hearts()
		

func _on_coin_collected():
	coins = coins + bankaccount
	print("jdjddsdfddsfffdsdfdfdsddfdsfsdf")
	#coins = 238
	_ready()

	

func load_hearts():
	$healthy.rect_size.x = Global.lives * 100
	$unhealthy.rect_size.x = (Global.max_lives - Global.lives) * 100
	$unhealthy.rect_position.x = $healthy.rect_position.x + $healthy.rect_size.x * $healthy.rect_scale.x

