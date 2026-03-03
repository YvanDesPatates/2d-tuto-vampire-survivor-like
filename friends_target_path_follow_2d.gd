extends PathFollow2D
class_name FriendsTargetPathFollow2d

func get_random_target() -> Node2D:
	var node = Node2D.new()
	progress_ratio = randf()
	var random_pos = global_position
	node.global_position = random_pos
	add_child(node)
	return node
	
