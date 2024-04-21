extends CharacterBody2D

@export var maxHealthPlayer : float = 100
@export var SPEED_MOVEMENT : int = 300;
@export var initSprite : CompressedTexture2D = null
@export var initWeapon : PropertiesWeapon = null

var healthPlayer : float:
	set(newHealth):
		healthPlayer = newHealth
		
		if playerHUD:
			playerHUD.SetLabelHealth(healthPlayer)
			
		
	

var playerHUD : MainHUD
var currCamera : Camera2D = null;

func _ready():
	GameManager.playerRef = self;
	currCamera = get_viewport().get_camera_2d();
	%RemoteTransform2D.remote_path = currCamera.get_path()
	ChangeWeapon(initWeapon)
	
	playerHUD = get_tree().get_first_node_in_group("MainHUD") as MainHUD
	
	healthPlayer = maxHealthPlayer


func SetSpritePlayer(newSprite : CompressedTexture2D):
	%SpritePlayer.texture = newSprite
	

func GetSpritePlayer() -> CompressedTexture2D:
	return %SpritePlayer.texture as CompressedTexture2D


func ChangeWeapon(newWeapon : PropertiesWeapon = null):
	
	var weaponPlayer = $WeaponPlayer as Node2D
	var newSpritePlayer : CompressedTexture2D = newWeapon.SpritePlayer as CompressedTexture2D
	
	if newWeapon == null:
		newSpritePlayer = initSprite
	
	weaponPlayer.SetWeapon(newWeapon)
	SetSpritePlayer(newSpritePlayer)

func GetInputVector():
	var inputDir : Vector2 = Input.get_vector("MoveLeft","MoveRight","MoveUp","MoveDown");
	return inputDir;


func MovementPlayer():
	velocity = GetInputVector() * SPEED_MOVEMENT;
	move_and_slide()
	
	LimitBorder()



func LimitBorder():
	var offset : Vector2 = %SpritePlayer.texture.get_size() / 2 * scale;
	var limitCam : Vector2 = Vector2(currCamera.limit_right,currCamera.limit_bottom);
	position = position.clamp(Vector2.ZERO +offset, limitCam - offset);



func _physics_process(delta):
	
	MovementPlayer()
	look_at(get_global_mouse_position())
	

func ReceiveDamage(countDamage : float):
	
	healthPlayer -= countDamage
	
	if healthPlayer <= 0:
		queue_free()



func _on_collider_player_body_entered(body):
	
	if body is BaseEnemy:
		ReceiveDamage(10)
		
	

