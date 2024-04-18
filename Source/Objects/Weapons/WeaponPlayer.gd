extends Node2D

@export var propWeapon : PropertiesWeapon;

var timerShooting : float = 0.0
var isShooting : bool = false

func _ready():
	timerShooting = propWeapon.cooldownShoot
	pass

func _input(event):
	
	if Input.is_action_just_pressed("Shooting"):
		StartShooting()
	
	if Input.is_action_just_released("Shooting"):
		StopShooting()
	
	pass

func _physics_process(delta):
	timerShooting -= delta
	pass



func StartShooting():
	
	isShooting = true;
	
	while isShooting:
		await get_tree().process_frame
		
		if timerShooting <= 0:
			Fire()
			timerShooting = propWeapon.cooldownShoot
	
	pass

func StopShooting():
	isShooting = false;
	pass


func Fire():
	if propWeapon.bulletScene == null:
		return
	
	var bulletInst : RigidBody2D = propWeapon.bulletScene.instantiate() as RigidBody2D
	bulletInst.global_position = global_position
	bulletInst.global_rotation_degrees = global_rotation_degrees
	
	get_tree().root.add_child(bulletInst);
	
	pass
