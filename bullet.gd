extends Area2D

const SPEED = 1000 #pixel per seconds
var travelled_distance = 0
var travell_max_distance = SPEED*2

func _physics_process(delta: float) -> void:
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta
	
	travelled_distance += SPEED * delta
	if travelled_distance > travell_max_distance:
		queue_free()
	
	


func _on_body_entered(body: Node2D) -> void:
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
