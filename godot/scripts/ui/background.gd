class_name Background
extends TextureRect

@export var textures: Array[CompressedTexture2D] = []

var RNG: RandomNumberGenerator = RandomNumberGenerator.new()

func _ready() -> void:
	var random_index: int = RNG.randi_range(0, len(textures) - 1)
	texture = textures[random_index]
	
	var do_flip_h: int = RNG.randi_range(0, 1)
	var do_flip_v: int = RNG.randi_range(0, 1)
	
	if do_flip_h == 1:
		flip_h = true
	if do_flip_v == 1:
		flip_v = true
