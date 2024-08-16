class_name SaveManager
extends Object

static func global_state_exists() -> bool:
	return FileAccess.file_exists(Paths.GLOBAL_STATE)

static func load_global_state() -> String:
	var file: FileAccess = FileAccess.open(Paths.GLOBAL_STATE, FileAccess.READ)
	if not file is FileAccess:
		push_error("Failed to load global state: %s" % file.get_error())
		return "{}"
	return file.get_as_text()

static func save_global_state(state: GlobalState) -> void:
	var file: FileAccess = FileAccess.open(Paths.GLOBAL_STATE, FileAccess.WRITE)
	if not file is FileAccess:
		push_error("Failed to save global state: %s" % file.get_error())
		return
	var json_string: String = state.to_json()
	file.store_string(json_string)

static func get_game_state_save_path(file_index: int) -> String:
	return "user://game_" + str(file_index) + ".save"
	
static func game_state_exists(file_index: int) -> bool:
	var path = get_game_state_save_path(file_index)
	return FileAccess.file_exists(path)

static func load_game_state(file_index: int) -> String:
	var path: String = get_game_state_save_path(file_index)
	var file: FileAccess = FileAccess.open(path, FileAccess.READ)
	if not file is FileAccess:
		push_error("Failed to load game state: %s" % file.get_error())
		return "{}"
	return file.get_as_text()

static func save_game_state(state: GameState) -> void:
	var path: String = get_game_state_save_path(state.file_index)
	var file: FileAccess = FileAccess.open(path, FileAccess.WRITE)
	if not file is FileAccess:
		push_error("Failed to save game state: %s" % file.get_error())
		return
	var json_string: String = state.to_json()
	file.store_string(json_string)
