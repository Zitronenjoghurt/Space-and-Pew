class_name Player
extends CharacterBody2D

var config: PlayerConfiguration
var ship_sprite: PlayerSprite

func _init(configuration: PlayerConfiguration) -> void:
	config = configuration

func _ready() -> void:
	ship_sprite = PlayerSprite.new(config.ship_type)
	add_child(ship_sprite)
	ship_sprite.display_regular()
