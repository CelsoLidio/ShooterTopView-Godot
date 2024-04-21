@tool
extends Node

@export var enemysType : Array[PackedScene] = []

@export_category("Spawner Configuration")
@export_range(0.8,2.5) var timeSpawning : float = 1.3

@export var spawnersPositions : Array[Marker2D] = []

func _ready():
	
	spawnersPositions.clear()
	for eachChild in get_children():
		if eachChild is Marker2D:
			spawnersPositions.append(eachChild)
		
	
	%TimerSpawn.wait_time = timeSpawning


func _on_timer_spawn_timeout():
	
	var pointSpawn : Marker2D = spawnersPositions[randi() % spawnersPositions.size()]
	var currEnemy : PackedScene = enemysType[randi() % enemysType.size()]
	
	var instEnemy : BaseEnemy = currEnemy.instantiate() as BaseEnemy
	instEnemy.position = pointSpawn.position
	
	get_tree().root.add_child(instEnemy)
	
	
