extends Node2D
class_name Game

const kill_distance_to_add_friend = 190

var enemies_created = 0
var enemies_killed = 0

func spawn_enemy():
	%PathFollow2D.progress_ratio = randf()
	var enemy: Node2D = preload("uid://v45siqi72g4b").instantiate()
	enemy.global_position = %PathFollow2D.global_position
	add_child(enemy)
	enemies_killed += 1


func _on_spawn_ennemies_timer_timeout() -> void:
	spawn_enemy()


func _on_player_health_reach_zero() -> void:
	$GameOverScreen.visible = true
	get_tree().paused = true
	
func on_ennemy_died(ennemy: Node2D):
	enemies_killed += 1
	const LITTLE_FRIEND = preload("uid://dwib6q4b566dp")
	if %Player.global_position.distance_to(ennemy.global_position) < kill_distance_to_add_friend:
		var instance = LITTLE_FRIEND.instantiate()
		instance.global_position = %Player.global_position - Vector2.DOWN
		add_child(instance)


func higher_spawn_rate_if_necessary():
	if enemies_created < 10:
		return
	
	if enemies_killed > enemies_created:
		%SpawnEnnemiesTimer.wait_time -= 0.1
