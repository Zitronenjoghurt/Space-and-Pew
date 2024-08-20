class_name GameMenu
extends Node2D

@onready var ship_selector: ShipSelector = %ShipSelector

func _ready() -> void:
	ship_selector.ship_clicked.connect(ship_selected)

func ship_selected(ship_id: Player.ID) -> void:
	pass
