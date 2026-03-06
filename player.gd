extends CharacterBody2D

signal health_reach_zero

const DAMMAGE_RATE = 22.0 # max damage per second
@export var speed: int = 600
@export var health: float = 100.0

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * speed
	move_and_slide()
	
	if velocity.length() > 0.0:
		%HappyBoo.play_walk_animation()
	else :
		%HappyBoo.play_idle_animation()
	
	var overlapping_enemies = %HitBox.get_overlapping_bodies()
	if overlapping_enemies.size() > 0:
		health -= DAMMAGE_RATE * overlapping_enemies.size() * delta
		%HealthBar.value = health
		if health <= 0.0:
			health_reach_zero.emit()
