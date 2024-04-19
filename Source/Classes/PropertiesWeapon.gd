extends Resource

class_name PropertiesWeapon

@export var countBullet : int = 10;
@export_range(0.5,5.0) var reloadingTime : float = 2.0;
@export_range(0.05,0.4) var cooldownShoot : float = 1.0;
@export var bulletScene : PackedScene = null;
@export var SpritePlayer : CompressedTexture2D = null


