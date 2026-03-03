extends CharacterBody2D

@export var speed = 900
@onready var player: Node2D = get_node("/root/Game/Player")
var is_coming_back_to_player = true
var real_target: Vector2
var random_target: Node2D
var target_is_a_higer_verctor
@onready var target_giver: FriendsTargetPathFollow2d = get_node("/root/Game/Player/FriendsTargetPath2D/FriendsTargetPathFollow2D")

func _ready() -> void:
	%SlimeYellow.play_walk()
	define_target_and_values()

func _physics_process(delta: float) -> void:
	real_target = player.global_position if is_coming_back_to_player else random_target.global_position
	var direction = global_position.direction_to(real_target)
	velocity = direction * speed
	move_and_slide()
	var distance = global_position.distance_to(real_target)
	var target_is_behind = distance <= 100 and distance >= -100
	if target_is_behind:
		define_target_and_values()


func define_target_and_values():
	is_coming_back_to_player = !is_coming_back_to_player
	target_is_a_higer_verctor = real_target > global_position
	if random_target:
		random_target.queue_free()
	random_target = target_giver.get_random_target()
