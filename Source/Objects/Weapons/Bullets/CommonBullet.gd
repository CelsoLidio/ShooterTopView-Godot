extends RigidBody2D

@export_range(0.1,1.0) var timerBullet : float = 0.5;
@export var damageBullet : float = 25

func _ready():
	var timerDelete = $Timer as Timer
	
	timerDelete.connect("timeout",DeleteBullet)
	timerDelete.start()
	
	apply_impulse(transform.basis_xform(Vector2.UP * 1000))
	

func _on_body_entered(body):
	
	if body is BaseEnemy:
		body.ReceiveDamage(damageBullet)
	
	DeleteBullet()
	

func DeleteBullet():
	queue_free()
