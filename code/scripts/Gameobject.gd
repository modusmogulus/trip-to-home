extends Node2D



var modifier_state = 0
onready var timer = $Timer
var time_left = 60
#onready var label = $Control/Label

func _ready():
	timer.wait_time = time_left
	
func _process(delta):
	if timer.time_left != null:
		time_left = timer.time_left
