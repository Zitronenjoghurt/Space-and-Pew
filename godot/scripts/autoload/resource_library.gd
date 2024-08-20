extends Node

@export var ship_resources: Array[PlayerShipData] = []
@export var weapon_resources: Array[WeaponData] = []

var ships: Dictionary = {}
var weapons: Dictionary = {}

func _ready() -> void:
	_load_ships()
	_load_weapons()

func _load_ships() -> void:
	for ship_data: PlayerShipData in ship_resources:
		var id: Player.ID = ship_data.ship_id
		if id in ships:
			push_warning("Skipping player ship resource: Duplicate ship id '%s'" % id)
			continue
		ships[id] = ship_data

func _load_weapons() -> void:
	for weapon_data: WeaponData in weapon_resources:
		var id: Weapon.ID = weapon_data.id
		if id in weapons:
			push_warning("Skipping weapon resource: Duplicate weapon id '%s'" % id)
			continue
		weapons[id] = weapon_data

func get_ship_data(ship_id: Player.ID) -> PlayerShipData:
	if ship_id not in ships:
		return null
	var data: PlayerShipData = ships.get(ship_id) as PlayerShipData
	return data.duplicate(true)

func get_ship_ids() -> Array[Player.ID]:
	return ships.keys()

func get_weapon_data(weapon_id: Weapon.ID) -> WeaponData:
	if weapon_id not in weapons:
		return null
	var data: WeaponData = weapons.get(weapon_id) as WeaponData
	return data.duplicate(true)

func get_weapon_ids() -> Array[Weapon.ID]:
	return weapons.keys()
