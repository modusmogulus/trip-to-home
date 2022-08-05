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
		

func _on_coin_collected():
	coins = coins + bankaccount
	if coins == 20:
		if Global.lives <= Global.max_lives:
			Global.lives += 1
			Global.hud.load_hearts()
		elif Global.lives >= Global.max_lives or Global.lives == Global.max_lives:
			Global.hud.load_hearts()
	if coins == 21:
		if Global.lives <= Global.max_lives:
			Global.lives += 1
			Global.hud.load_hearts()
		elif Global.lives >= Global.max_lives:
			Global.hud.load_hearts()	
	if coins == 40:
		if Global.lives <= Global.max_lives:
			Global.lives += 1
			Global.hud.load_hearts()
		elif Global.lives >= Global.max_lives or Global.lives == Global.max_lives:
			Global.hud.load_hearts()
	_ready()


	

func load_hearts():
	$healthy.rect_size.x = Global.lives * 100
	$unhealthy.rect_size.x = (Global.max_lives - Global.lives) * 100
	$unhealthy.rect_position.x = $healthy.rect_position.x + $healthy.rect_size.x * $healthy.rect_scale.x

