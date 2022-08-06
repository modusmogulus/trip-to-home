extends Node2D

onready var gameobject = get_node("/root/Gameobject")
onready var sfx = $sfx
onready var sprite = $AnimatedSprite
onready var collider = $Area2D/CollisionShape2D
export var scene_to_load = "res://scenes/parallax_bg.tscn"

func _ready():
	pass
	
func _process(delta):
	pass
	
func _on_Area2D_body_entered(body):
	if body.name == "Player":
		sprite.visible = false
		collider.disabled = true
		sfx.play()
		get_tree().change_scene("res://Menu/YouWon.tscn")
		#TODO CHANGE TO YOU WIN SCENE!
		get_tree().change_scene(scene_to_load)
