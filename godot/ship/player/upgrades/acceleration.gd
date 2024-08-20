class_name AccelerationShipUpgrade
extends ShipUpgradeBase

@export var acceleration_increases: Array[UpgradeStageInt] = []

func get_type() -> ShipUpgradeBase.Type:
	return ShipUpgradeBase.Type.Acceleration

func apply(ship_data: PlayerShipData, level_index: int) -> void:
	if level_index < 0 or len(acceleration_increases) == 0:
		return
	var stage: UpgradeStageInt = acceleration_increases[-1]
	if level_index < len(acceleration_increases):
		stage = acceleration_increases[level_index]
		
	var acceleration_increase: int = stage.value
	ship_data.acceleration += acceleration_increase
