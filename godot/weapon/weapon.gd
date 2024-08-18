class_name Weapon
extends Node

var data: WeaponData

enum ID {
	None = 0,
	BaseBlue = 1
}

func _init(_data: WeaponData) -> void:
	data = _data
