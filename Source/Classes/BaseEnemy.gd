extends CharacterBody2D

class_name BaseEnemy
@export_category("Properties Enemy")
@export var health : float = 100
@export_range(0.5,2.5) var movSpeed : float = 1.2

@export_category("Navigation Enemy")
@export var navAgent : NavigationAgent2D
@export_range(5.0,50.0) var distanceTarget : float = 10
@export_range(0.5,2.0) var timerDetectTarget : float = 1.0


var targetObj : CharacterBody2D

func _ready():
	
	targetObj = GameManager.playerRef
	DetectTarget()


func _physics_process(delta):
	
	if targetObj != null:
		
		if position.distance_to(targetObj.position) > distanceTarget * 10:
			ChaseTarget()
		
		LookingTarget()
	
	

func ChaseTarget():
	
	if targetObj == null or navAgent == null:
		print("[ERROR - BaseEnemy] Target Obj or NavAgent not found...")
		return
	
	if position.distance_to(navAgent.target_position) < 3:
		return
	
	var targetPosNormalized = (navAgent.get_next_path_position() - position).normalized()
	
	velocity = targetPosNormalized * (movSpeed * 100)
	
	move_and_slide()


func LookingTarget():
	
	if targetObj == null:
		return
	
	look_at(targetObj.position)
	

func DetectTarget():
	
	if targetObj == null:
		await get_tree().create_timer(timerDetectTarget).timeout
		DetectTarget()
		return
	
	navAgent.target_position = targetObj.position
	await get_tree().create_timer(timerDetectTarget).timeout
	DetectTarget()


func ReceiveDamage(countDamage : float):
	
	health -= countDamage
	
	if health <= 0:
		DestroyEnemy();
	

func DestroyEnemy():
	queue_free()
