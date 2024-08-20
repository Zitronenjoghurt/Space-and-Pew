class_name ShipSelector
extends PanelContainer

@onready var ship_0: ShipSelectorIcon = %Ship0

signal ship_clicked(ship_id: Player.ID)

func _ready() -> void:
	ship_0.clicked.connect(ship_icon_clicked)

func ship_icon_clicked(id: Player.ID) -> void:
	ship_clicked.emit(id)
