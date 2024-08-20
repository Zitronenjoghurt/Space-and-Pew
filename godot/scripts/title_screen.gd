class_name TitleScreen
extends Node2D

@onready var main_menu: MainMenu = %MainMenu

func _ready() -> void:
	main_menu.play_pressed.connect(_on_play_pressed)

func _on_play_pressed() -> void:
	GameManager.load_game(0)
