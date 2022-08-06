extends Node

var max_lives = 5
var lives = max_lives
var hud
var UNIT_SIZE

signal coin_collected

func lose_life():
	lives -= 1
	hud.load_hearts()
	if lives <= 0:
		#get_tree().change_scene("res://die.tscn")
		#get_tree().change_scene("res://scenes/gameover.tscn")		
		yield(get_tree().create_timer(0.01),"timeout")
		get_tree().change_scene("res://scenes/gameover.tscn")	
		lives = max_lives
		hud.load_hearts()
		print("wowowo")



