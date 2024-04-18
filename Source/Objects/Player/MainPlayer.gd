extends CharacterBody2D

@export var SPEED_MOVEMENT : int = 300;

var currCamera : Camera2D = null;

func _ready():
	GameManager.playerRef = self;
	currCamera = get_viewport().get_camera_2d();
	
	%RemoteTransform2D.remote_path = currCamera.get_path()
	
	pass




func _input(event):
	
	pass


func GetInputVector():
	var inputDir : Vector2 = Input.get_vector("MoveLeft","MoveRight","MoveUp","MoveDown");
	return inputDir;


func MovementPlayer():
	velocity = GetInputVector() * SPEED_MOVEMENT;
	move_and_slide()
	
	LimitBorder()

func LimitBorder():
	var offset : Vector2 = $Sprite2D.texture.get_size() / 2 * scale;
	var limitCam : Vector2 = Vector2(currCamera.limit_right,currCamera.limit_bottom);
	position = position.clamp(Vector2.ZERO +offset, limitCam - offset);

func _physics_process(delta):
	
	MovementPlayer()
	
	look_at(get_global_mouse_position())
	
	pass
