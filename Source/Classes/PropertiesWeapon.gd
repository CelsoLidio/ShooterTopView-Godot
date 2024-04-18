extends Resource

class_name PropertiesWeapon

@export var countBullet : int = 10;
@export_range(0,1) var reloadingTime : float = 0.5;
@export_range(0,1) var cooldownShoot : float = 1.0;
@export var bulletScene : PackedScene = null;


