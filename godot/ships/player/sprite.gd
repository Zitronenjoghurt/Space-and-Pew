class_name PlayerSprite
extends Sprite2D

@onready var spritesheet: Texture2D = load(Paths.PLAYER_SHIP_SPRITESHEET)
var ship_index: int = 0

var regular_texture: AtlasTexture
var strafe_left_texture: AtlasTexture
var strafe_right_texture: AtlasTexture

const INITIAL_ROTATION_DEGREES: int = 90
const SPRITE_SIZE: Vector2i = Vector2i(8, 8)
var strafe_left_x: int = 0
var regular_pos_x: int = SPRITE_SIZE.x
var strafe_right_x: int = SPRITE_SIZE.x * 2

func _init(_ship_index: int) -> void:
	ship_index = _ship_index

func _ready() -> void:
	rotation_degrees = INITIAL_ROTATION_DEGREES
	
	var regular_coords: Vector2i = Vector2i(regular_pos_x, ship_index * SPRITE_SIZE.y)
	var strafe_left_coords: Vector2i = Vector2i(strafe_left_x, ship_index * SPRITE_SIZE.y)
	var strafe_right_coords: Vector2i = Vector2i(strafe_right_x, ship_index * SPRITE_SIZE.y)
	
	regular_texture = AtlasTexture.new()
	strafe_left_texture = AtlasTexture.new()
	strafe_right_texture = AtlasTexture.new()
	
	regular_texture.atlas = spritesheet
	strafe_left_texture.atlas = spritesheet
	strafe_right_texture.atlas = spritesheet
	
	regular_texture.region = Rect2i(regular_coords, SPRITE_SIZE)
	strafe_left_texture.region = Rect2i(strafe_left_coords, SPRITE_SIZE)
	strafe_right_texture.region = Rect2i(strafe_right_coords, SPRITE_SIZE)
	
	display_regular()

func display_strafe_left() -> void:
	texture = strafe_left_texture

func display_regular() -> void:
	texture = regular_texture

func display_strafe_right() -> void:
	texture = strafe_right_texture
