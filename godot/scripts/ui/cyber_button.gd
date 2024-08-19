class_name CyberButton
extends TextureButton

@onready var label: Label = %Label
@onready var reflection_sprite: AnimatedSprite2D = %ReflectionSprite

@export var text: String = ""
@export var reflection_cooldown_sec: float = 5.0

func _ready() -> void:
	label.text = text
	var timer: Timer = Timer.new()
	timer.timeout.connect(play_reflection)
	add_child(timer)
	timer.start(reflection_cooldown_sec)

func _on_button_down() -> void:
	label.position.y = 2
	reflection_sprite.position.y = 9

func _on_button_up() -> void:
	label.position.y = 0
	reflection_sprite.position.y = 7

func play_reflection() -> void:
	reflection_sprite.play("woosh")
