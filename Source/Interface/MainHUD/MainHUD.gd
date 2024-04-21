extends CanvasLayer

class_name MainHUD

func _ready():
	pass

func SetLabelBullets(newCount : float):
	%CountBullets.text = str(newCount)

func SetLabelHealth(countHealth : float):
	%HealthBar.value = countHealth

func SetLabelScore(newScore : int):
	%CountScore.text = str(newScore)


