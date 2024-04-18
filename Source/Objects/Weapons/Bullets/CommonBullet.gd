extends RigidBody2D


func _ready():
	
	
	apply_impulse(transform.basis_xform(Vector2.UP * 1000))
	
	pass # Replace with function body.

func _on_body_entered(body):
	queue_free()
	
	pass
