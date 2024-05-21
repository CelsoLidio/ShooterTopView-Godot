extends Node

@export_file("*tscn") var pauseScene : String

# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	pass # Replace with function body.


func _input(event):
	
	if (Input.is_action_just_pressed("ui_cancel")):
		var instPause : MainMenu = load(pauseScene).instantiate()
		
		instPause.ChangeTypeMenu(MainMenu.typeMenu.PauseMenu)
		get_tree().paused = true
		get_tree().current_scene.add_child(instPause)
		
