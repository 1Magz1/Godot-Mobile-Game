extends CharacterBody2D


@export var SPEED = 4500.0
var is_flying := false

func _physics_process(delta: float):
	if is_flying:
		move_and_collide(Vector2.UP * SPEED * delta)

func throw():
	is_flying = true
