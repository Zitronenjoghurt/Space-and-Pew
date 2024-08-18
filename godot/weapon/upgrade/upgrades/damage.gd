class_name DamageWeaponUpgrade
extends WeaponUpgradeBase

@export var damage_increases: Array[UpgradeStageInt] = []

func get_type() -> WeaponUpgradeBase.Type:
	return WeaponUpgradeBase.Type.Damage

func apply(weapon_data: WeaponData, level_index: int) -> void:
	if level_index < 0 or len(damage_increases) == 0:
		return
	var stage: UpgradeStageInt = damage_increases[-1]
	if level_index < len(damage_increases):
		stage = damage_increases[level_index]
		
	var damage_increase: int = stage.value
	weapon_data.projectile_data.damage += damage_increase
