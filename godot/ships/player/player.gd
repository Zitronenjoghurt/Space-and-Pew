class_name Player
extends Ship

var state_machine_scene: PackedScene = load(Paths.PLAYER_STATE_MACHINE)
var config: PlayerConfiguration
var ship_sprite: PlayerSprite
@onready var screen_size: Vector2 = get_viewport_rect().size

func _init(configuration: PlayerConfiguration) -> void:
	config = configuration
	# Values for testing, will be moved later
	config.acceleration = 75
	config.max_speed = 200
	config.rotation_speed = 4
	config.drag_factor = 0.8

func _ready() -> void:
	_load_ship_sprite()
	_load_state_machine()
	apply_player_config(config)

func _load_ship_sprite() -> void:
	ship_sprite = PlayerSprite.new(config.ship_type)
	add_child(ship_sprite)

func _load_state_machine() -> void:
	var state_machine: FSM = state_machine_scene.instantiate()
	add_child(state_machine)

func _physics_process(_delta: float) -> void:
	move_and_slide()
	wrap_position()

func wrap_position() -> void:
	position.x = wrapf(position.x, 0, screen_size.x)
	position.y = wrapf(position.y, 0, screen_size.y)

func rotate_to_mouse(delta: float) -> void:
	var mouse_position: Vector2 = get_global_mouse_position()
	var target_rotation: float = (mouse_position - global_position).angle()
	rotate_to_target(target_rotation, delta)
