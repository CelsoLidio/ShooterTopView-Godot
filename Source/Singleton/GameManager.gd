extends Node

var playerRef : CharacterBody2D = null;

var mainHUD : MainHUD

var scoreGame : float:
	set(newScore):
		scoreGame = newScore
		
		if GetMainHUD() != null:
			mainHUD.SetLabelScore(scoreGame)
		

func _ready():
	
	ResetGame()

func AddScore(countScore : float):
	scoreGame += countScore
	

func GameOver():
	get_tree().paused = true
	
	if GetMainHUD() != null:
		mainHUD.GameOverHUD()
	

func GetMainHUD() -> MainHUD:
	
	
	if mainHUD == null:
		mainHUD = get_tree().get_first_node_in_group("MainHUD")
	
	return mainHUD


func ResetGame():
	scoreGame = 0
