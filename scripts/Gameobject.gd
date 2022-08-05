extends Node2D



var modifier_state = 0
onready var timer = $Timer
var time_left = 60
onready var label = $Control/Label


func _process(delta):
	timer.time_left
	if timer.time_left != null:
		label.text = str(ceil(timer.time_left))
