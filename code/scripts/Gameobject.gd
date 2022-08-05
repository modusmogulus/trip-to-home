extends Node2D



var modifier_state = 0
onready var timer = $Timer
export var time_left = 23
onready var label = $Control/Label

func _ready():
	timer.wait_time = time_left
	
func _process(delta):
	timer.time_left
	if timer.time_left != null:
		label.text = str(ceil(timer.time_left))
