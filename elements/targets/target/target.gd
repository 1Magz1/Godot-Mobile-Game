extends CharacterBody2D
class_name Target

const SPEED := PI
const KNIFE_POSITION := Vector2(0, 180)

@onready var item_container := $ItemsContainer

func _physics_process(delta: float):
	rotation += SPEED * delta

func add_object_with_pivot(object: Node2D, object_rotation: float):
	var pivot := Node2D.new()
	pivot.rotation = object_rotation
	pivot.add_child(object)
	item_container.add_child(pivot)
