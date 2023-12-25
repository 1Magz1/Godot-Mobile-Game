extends CharacterBody2D


@export var SPEED = 4500.0
var is_flying := false

func _physics_process(delta: float):
	if is_flying:
		var collision = move_and_collide(Vector2.UP * SPEED * delta)
		handle_collision(collision)

func throw():
	is_flying = true

func handle_collision(collision: KinematicCollision2D):
	if collision == null: return
	
	var collider := collision.get_collider()

	if collider is Target:
		add_knife_to_target(collider)
		is_flying = false

func add_knife_to_target(target: Target):
	get_parent().remove_child(self)
	global_position = target.KNIFE_POSITION
	rotation = 0
	target.add_object_with_pivot(self, -target.rotation)
