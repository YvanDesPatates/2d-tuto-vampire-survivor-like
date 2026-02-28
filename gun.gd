extends Area2D

func _physics_process(delta: float) -> void:
	var enemies_in_a_range: Array[Node2D] = get_overlapping_bodies()
	if enemies_in_a_range.size() > 0:
		var target_ennemy = enemies_in_a_range[0]
		look_at(target_ennemy.global_position)
