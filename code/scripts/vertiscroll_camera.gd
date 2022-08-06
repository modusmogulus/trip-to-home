extends Camera2D

onready var gameobject = get_node("/root/Gameobject")
onready var time_left = gameobject.time_left
onready var label = $Control/Label

export var decay = 0.8  # How quickly the shaking stops [0, 1].
export var max_offset = Vector2(100, 75)  # Maximum hor/ver shake in pixels.
export var max_roll = 0.1  # Maximum rotation in radians (use sparingly).
export (NodePath) var target  # Assign the node this camera will follow.

var camerashake = 0.0  # Current shake strength.
var camerashake_power = 2  # Trauma exponent. Use [2, 3].



func _ready():
	
	randomize()
	
	gameobject.camera = self

	if time_left != null:
		label.text = str(ceil(gameobject.time_left))

func shake():
	var amount = pow(camerashake, camerashake_power)
	rotation = max_roll * amount * rand_range(-1, 1)
	offset.x = max_offset.x * amount * rand_range(-1, 1)
	offset.y = max_offset.y * amount * rand_range(-1, 1)

func _process(delta):
	if target:
		global_position = get_node(target).global_position
	if camerashake:
		camerashake = max(camerashake - decay * delta, 0)
		shake()
