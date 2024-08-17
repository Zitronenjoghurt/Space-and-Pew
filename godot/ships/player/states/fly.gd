class_name PlayerFlyState
extends State

@onready var player: Player = get_parent().get_parent()

func enter() -> void:
	player.ship_sprite.display_regular()

func update(delta: float) -> void:
	if Input.is_action_pressed("accelerate"):
		player.accelerate(delta)
	else:
		player.apply_drag(delta)
	player.rotate_to_mouse(delta)
