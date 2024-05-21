extends CanvasLayer

class_name MainMenu

@export_file("*.tscn") var gameplayMap : String
enum typeMenu {InitMenu, PauseMenu}

var currentType : typeMenu = typeMenu.InitMenu

func _ready():
	ChangeTypeMenu(currentType)
	pass


func _on_start_game_bt_pressed():
	get_tree().change_scene_to_file(gameplayMap)

func _on_quit_bt_pressed():
	get_tree().quit()


func _on_continue_pressed():
	get_tree().paused = false
	queue_free()
	
	pass

func ChangeTypeMenu(newType : typeMenu):
	
	currentType = newType
	
	match currentType as typeMenu:
		
		typeMenu.InitMenu:
			(%TabsStartBTMenu as TabContainer).current_tab = 0;
		
		typeMenu.PauseMenu:
			
			(%TabsStartBTMenu as TabContainer).current_tab = 1;
	
