extends RichTextLabel


func _ready():
	
	visible_characters = 1

func _process(delta):
	
	visible_characters += 1
	if Input.is_action_pressed("ui_select"):
		get_tree().change_scene("res://scenes/map1.tscn")

