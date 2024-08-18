class_name Projectile
extends Area2D

enum Target {
	PLAYER,
	ENEMY
}

var damage: int = 0
var speed: int = 0
var lifetime_sec: float = 0
var piercing: bool = false
# -1 means theres no piercing limit
var piercing_amount: int = -1
var target: Target = Target.ENEMY

var velocity: Vector2 = Vector2.ZERO
var timer: Timer = Timer.new()
var pierced_targets: int = 0

func _ready():
	timer.one_shot = true
	timer.start(lifetime_sec)
	timer.timeout.connect(kill)

func kill():
	get_parent().remove_child(self)
	queue_free()

func apply_data(data: ProjectileData, _target: Target) -> void:
	damage = data.damage
	speed = data.speed
	lifetime_sec = data.lifetime_sec
	piercing = data.piercing
	piercing_amount = data.piercing_amount
	target = _target

func launch(direction: Vector2) -> void:
	velocity = direction * speed

func _physics_process(delta: float) -> void:
	global_position += velocity * delta

func on_hit() -> void:
	if not piercing:
		kill()
		return
	
	if piercing_amount == -1:
		return
	
	pierced_targets += 1
	if pierced_targets >= piercing_amount:
		kill()
		return
