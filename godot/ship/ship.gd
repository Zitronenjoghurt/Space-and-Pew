class_name Ship
extends CharacterBody2D

var data: ShipData = ShipData.new()

func _init(_data: ShipData) -> void:
	data = _data

func get_current_direction() -> Vector2:
	return Vector2.from_angle(rotation)

func accelerate(delta: float) -> void:
	var direction: Vector2 = get_current_direction()
	velocity += direction * data.acceleration * delta
	velocity = velocity.limit_length(data.max_speed)

func apply_drag(delta: float) -> void:
	velocity = velocity.lerp(Vector2.ZERO, data.drag_factor * delta)

func rotate_to_target(target_rotation: float, delta: float) -> void:
	rotation = lerp_angle(rotation, target_rotation, data.rotation_speed * delta)
