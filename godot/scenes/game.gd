class_name Game
extends Node2D

var player: Player
var player_configuration: PlayerConfiguration = PlayerConfiguration.new()
const player_spawn_position: Vector2i = Vector2i(320, 180)

func _ready() -> void:
	_spawn_player()

func _spawn_player() -> void:
	if player_configuration is not PlayerConfiguration:
		push_error("Unable to spawn player: missing player configuration.")
		return
		
	var _player: Player = Player.new(player_configuration)
	player = _player
	add_child(_player)
	player.global_position = player_spawn_position
