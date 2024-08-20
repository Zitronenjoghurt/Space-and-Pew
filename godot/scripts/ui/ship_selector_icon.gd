class_name ShipSelectorIcon
extends Area2D

@export var ship_id: Player.ID
@onready var sprite: Sprite2D = %Sprite

signal clicked(ship_id: Player.ID)

func _ready() -> void:
	disable()

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if not event is InputEventMouse:
		return
	if event.button_mask == MOUSE_BUTTON_LEFT and event.is_pressed():
		clicked.emit(ship_id)

func enable() -> void:
	sprite.modulate = Color(1, 1, 1, 1)

func disable() -> void:
	sprite.modulate = Color(0, 0, 0, 0.5)
