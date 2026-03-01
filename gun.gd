extends Area2D

var is_enemy_in_range = false

func _physics_process(delta: float) -> void:
	var enemies_in_a_range: Array[Node2D] = get_overlapping_bodies()
	is_enemy_in_range = enemies_in_a_range.size() > 0
	if is_enemy_in_range == true:
		var target_ennemy = enemies_in_a_range[0]
		look_at(target_ennemy.global_position)


func shoot():
	if !is_enemy_in_range:
		return
	
	const BULLET = preload("res://bullet.tscn")
	var new_bullet: Node2D = BULLET.instantiate()
	new_bullet.global_position = %BulletSpawn.global_position
	new_bullet.global_rotation = %BulletSpawn.global_rotation
	%BulletSpawn.add_child(new_bullet)


func _on_shooting_timer_timeout() -> void:
	shoot()
