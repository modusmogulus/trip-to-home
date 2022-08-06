extends RichTextLabel


func _ready():
	
	visible_characters = 1

func _process(delta):
	
	visible_characters += 1
