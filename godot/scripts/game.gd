class_name Game
extends Node2D

var player: Player
const player_spawn_position: Vector2i = Vector2i(320, 180)

func _ready() -> void:
	_spawn_player()

func _spawn_player() -> void:
	var _player: Player = Player.new(PlayerShipData.new())
	player = _player
	add_child(_player)
	player.global_position = player_spawn_position
