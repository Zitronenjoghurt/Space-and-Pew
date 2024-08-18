class_name WeaponData
extends Resource

@export var id: Weapon.ID
@export var name: String
@export var behavior: WeaponBehaviorBase
@export var projectile_data: ProjectileData
@export var projectile_scene: PackedScene
@export var upgrades: Array[WeaponUpgradeBase] = []
