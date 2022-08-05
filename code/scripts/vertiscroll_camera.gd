extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#onready var sprite = $AnimatedSprite
onready var gameobject = get_node("/root/Gameobject")
onready var time_left = gameobject.time_left
onready var label = $Control/Label
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


	if time_left != null:
		label.text = str(ceil(gameobject.time_left))
