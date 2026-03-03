extends CharacterBody2D

@onready var player = get_node("/root/Game/Player")
@onready var game: Game = get_node("/root/Game")
var speed: int = 300
var health = 3

func _ready() -> void:
	%Slime.play_walk()

func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	move_and_slide()

func take_damage():
	health -= 1
	%Slime.play_hurt()
	if health == 0:
		game.on_ennemy_died(self)
		queue_free()
		var smoke_instance:Node2D = preload("res://smoke_explosion/smoke_explosion.tscn").instantiate()
		get_parent().add_child(smoke_instance)
		smoke_instance.global_position = global_position
