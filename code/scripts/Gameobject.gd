extends Node2D



var modifier_state = 0
var ice_creams_left = 0
var ice_creams_eaten = 0
var ice_creams_meted = 0
var player_height = 0
var camera = null

onready var timer = $Timer
var time_left = 60
#onready var label = $Control/Label

func _ready():
	timer.wait_time = time_left
	
func _process(delta):

	if ice_creams_meted >= 5:
		get_tree().change_scene("res://scenes/map1.tscn")
