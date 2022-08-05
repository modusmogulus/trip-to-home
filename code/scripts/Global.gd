extends Node

var max_lives = 5
var lives = max_lives
var hud
var UNIT_SIZE

func lose_life():
	lives -= 1
	hud.load_hearts()
	if lives <= 0:
		#get_tree().change_scene("res://die.tscn")
		get_tree().reload_current_scene()		
		yield(get_tree().create_timer(0.01),"timeout")
		lives = max_lives
		hud.load_hearts()
		print("wowowo")



