class_name ProjectileData
extends Resource

@export var damage: int = 0
@export var speed: int = 0
@export var lifetime_sec: float = 0
@export var piercing: bool = false
# -1 means theres no piercing limit, else its the amount of targets that can be pierced
@export var piercing_amount: int = -1
