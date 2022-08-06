extends Node2D



export var scene_to_load = "res://scenes/parallax_bg.tscn"


func _ready():
	pass


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene(scene_to_load)
