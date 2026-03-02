extends CharacterBody2D

@export var speed = 900
@onready var player: Node2D = get_node("/root/Game/Player")
var target: Vector2 = Vector2.RIGHT*500
var is_coming_back_to_player = true
var real_target: Vector2
var target_is_a_higer_verctor

func _ready() -> void:
	%SlimeYellow.play_walk()
	define_target_and_values()

func _physics_process(delta: float) -> void:
	real_target = player.global_position if is_coming_back_to_player else target
	var direction = global_position.direction_to(real_target)
	velocity = direction * speed
	move_and_slide()
	var target_is_behind = global_position - real_target <= Vector2(30, 30) if target_is_a_higer_verctor else  real_target - global_position <= Vector2(30, 30)
	if target_is_behind:
		define_target_and_values()


func define_target_and_values():
	is_coming_back_to_player = !is_coming_back_to_player
	target_is_a_higer_verctor = real_target > global_position
