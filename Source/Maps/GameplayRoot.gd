extends Node2D

func _ready():
	pass # Replace with function body.


func _input(event):
	
	if (Input.is_action_just_pressed("ui_cancel")):
		get_tree().quit()
	

func _process(delta):
	pass
