extends Node

var game_scene: PackedScene = load(Paths.GAME_SCENE)
var global_state: GlobalState
var game_state: GameState

func _ready() -> void:
	_load_global_state()

func _load_global_state() -> void:
	if SaveManager.global_state_exists():
		var global_state_string: String = SaveManager.load_global_state()
		global_state = GlobalState.from_json(global_state_string)
	else:
		global_state = GlobalState.create_new()

func _load_game_state(file_index: int) -> void:
	if SaveManager.game_state_exists(file_index):
		var game_state_string: String = SaveManager.load_game_state(file_index)
		game_state = GameState.from_json(game_state_string)
	else:
		game_state = GameState.create_new(Config.GAME_VERSION, file_index)
		
func load_game(file_index: int = 0):
	_load_game_state(file_index)
	get_tree().change_scene_to_packed(game_scene)
