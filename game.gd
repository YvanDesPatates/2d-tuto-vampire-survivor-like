extends Node2D
class_name Game

const max_kill_distance_to_add_friend = 600
const min_kill_distance_to_add_friend = 180
var actual_kill_distance_to_add_friend = max_kill_distance_to_add_friend

func spawn_enemy():
	%PathFollow2D.progress_ratio = randf()
	var enemy: Node2D = preload("uid://v45siqi72g4b").instantiate()
	enemy.global_position = %PathFollow2D.global_position
	add_child(enemy)


func _on_spawn_ennemies_timer_timeout() -> void:
	spawn_enemy()


func _on_player_health_reach_zero() -> void:
	$GameOverScreen.visible = true
	get_tree().paused = true
	
func on_ennemy_died(ennemy: Node2D):
	const LITTLE_FRIEND = preload("uid://dwib6q4b566dp")
	if %Player.global_position.distance_to(ennemy.global_position) < max_kill_distance_to_add_friend:
		actual_kill_distance_to_add_friend = max(min_kill_distance_to_add_friend, actual_kill_distance_to_add_friend*0.6)
		var instance = LITTLE_FRIEND.instantiate()
		instance.global_position = %Player.global_position - Vector2.DOWN
		add_child(instance)
