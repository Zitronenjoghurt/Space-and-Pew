class_name Ship
extends CharacterBody2D

var acceleration: int = 0
var max_speed: int = 0
var rotation_speed: int = 0
var drag_factor: float = 0

func get_current_direction() -> Vector2:
	return Vector2.from_angle(rotation)

func apply_player_config(config: PlayerConfiguration) -> void:
	acceleration = config.acceleration
	max_speed = config.max_speed
	rotation_speed = config.rotation_speed
	drag_factor = config.drag_factor

func accelerate(delta: float) -> void:
	var direction: Vector2 = get_current_direction()
	velocity += direction * acceleration * delta
	velocity = velocity.limit_length(max_speed)

func apply_drag(delta: float) -> void:
	velocity = velocity.lerp(Vector2.ZERO, drag_factor * delta)

func rotate_to_target(target_rotation: float, delta: float) -> void:
	rotation = lerp_angle(rotation, target_rotation, rotation_speed * delta)
