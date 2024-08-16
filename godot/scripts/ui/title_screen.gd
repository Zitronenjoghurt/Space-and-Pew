class_name TitleScreen
extends Node2D

@export var game_scene: PackedScene
@onready var main_menu: MainMenu = %MainMenu

func _ready() -> void:
	main_menu.play_pressed.connect(_on_play_pressed)

func _on_play_pressed() -> void:
	GameManager.load_game()
