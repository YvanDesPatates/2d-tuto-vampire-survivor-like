extends Node2D

func spawn_enemy():
	%PathFollow2D.progress_ratio = randf()
	var enemy: Node2D = preload("uid://v45siqi72g4b").instantiate()
	enemy.global_position = %PathFollow2D.global_position
	add_child(enemy)


func _on_spawn_ennemies_timer_timeout() -> void:
	spawn_enemy()
