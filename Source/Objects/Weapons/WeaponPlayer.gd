extends Node2D

@export_category("Properties Weapon")
@export var propWeapon : PropertiesWeapon;

@export_category("Sprites Player")
@export var spriteReload : CompressedTexture2D = null

var HUDWeapon : MainHUD

var timerShooting : float = 0.0
var isShooting : bool = false

var currentBullets : int = 0 :
	set(newCurrentBullet):
		currentBullets = newCurrentBullet
		if HUDWeapon != null:
			HUDWeapon.SetLabelBullets(currentBullets)

var isReloading : bool = false



func _ready():
	
	if owner != null:
		await owner.ready
	
	HUDWeapon = get_tree().get_first_node_in_group("MainHUD") as MainHUD
	
	timerShooting = propWeapon.cooldownShoot
	currentBullets = propWeapon.countBullet
	
	

func _input(event):
	
	if Input.is_action_just_pressed("Shooting"):
		StartShooting()
	
	if Input.is_action_just_released("Shooting"):
		StopShooting()
	
	if Input.is_action_just_pressed("Reload"):
		Reloading()
	

func _physics_process(delta):
	timerShooting -= delta
	pass



func StartShooting():
	
	if propWeapon == null:
		return
	
	isShooting = true;
	
	while isShooting:
		await get_tree().process_frame
		
		if isReloading:
			continue
		
		if currentBullets <= 0:
			Reloading()
			return
		
		if timerShooting <= 0:
			Fire()
			timerShooting = propWeapon.cooldownShoot
	
	pass

func StopShooting():
	isShooting = false;
	pass


func Reloading():
	
	if propWeapon == null or isReloading:
		return
	
	if owner.has_method("SetSpritePlayer"):
		owner.SetSpritePlayer(spriteReload)
	
	isReloading = true
	
	await get_tree().create_timer(propWeapon.reloadingTime).timeout
	
	if owner.has_method("ChangeWeapon"):
		owner.ChangeWeapon(propWeapon)
	
	currentBullets = propWeapon.countBullet
	isReloading = false

func Fire():
	
	if propWeapon == null:
		return
	
	if propWeapon.bulletScene == null:
		return
	
	var bulletInst : RigidBody2D = propWeapon.bulletScene.instantiate() as RigidBody2D
	bulletInst.global_position = global_position
	bulletInst.global_rotation_degrees = global_rotation_degrees
	
	get_tree().current_scene.add_child(bulletInst);
	
	currentBullets -= 1
	


func SetWeapon(newWeapon : PropertiesWeapon):
	propWeapon = newWeapon

func GetWeapon() -> PropertiesWeapon:
	return propWeapon as PropertiesWeapon
