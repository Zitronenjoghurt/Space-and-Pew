class_name WeaponUpgradeBase
extends Resource

enum Type {
	None = 0,
	Damage = 1
}

func get_type() -> Type:
	return Type.None

# Level index is the index of the upgrade to be applied
# Stats will only change starting from level 2, so level_index 0 is level 2
func apply(_weapon_data: WeaponData, _level_index: int) -> void:
	pass
