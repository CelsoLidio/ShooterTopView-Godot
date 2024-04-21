extends Node

var playerRef : CharacterBody2D = null;

var mainHUD : MainHUD

var scoreGame : float :
	set(newScore):
		scoreGame = newScore
		
		if mainHUD:
			mainHUD.SetLabelScore(scoreGame) 

func _ready():
	
	mainHUD = get_tree().get_first_node_in_group("MainHUD") as MainHUD


func AddScore(countScore : float):
	scoreGame += countScore
	
