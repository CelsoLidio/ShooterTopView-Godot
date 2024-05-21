extends CanvasLayer

class_name MainHUD

const mainMenuScene : String = "res://Source/Interface/MainMenu/MainMenu.tscn"


func _ready():
	%GameOver.hide()
	SetLabelScore(0)
	pass

func SetLabelBullets(newCount : float):
	%CountBullets.text = str(newCount)

func SetLabelHealth(countHealth : float):
	%HealthBar.value = countHealth

func SetLabelScore(newScore : int):
	%CountScore.text = str(newScore)

func GameOverHUD():
	
	%CountScoreGameOver.text = %CountScore.text
	%GameOver.show()
	


func _on_restart_bt_pressed():
	get_tree().reload_current_scene()
	
	pass
	


func _on_menu_bt_pressed():
	get_tree().change_scene_to_file(mainMenuScene)
	pass


func _on_game_over_tree_exiting():
	get_tree().paused = false
	pass
