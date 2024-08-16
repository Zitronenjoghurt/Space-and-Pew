class_name SaveManager
extends Object

static func load_global_state() -> String:
	var file: FileAccess = FileAccess.open(Paths.GLOBAL_STATE, FileAccess.READ)
	if not file is FileAccess:
		return "{}"
	
	return file.get_as_text()

static func save_global_state(state: GlobalState) -> void:
	var file: FileAccess = FileAccess.open(Paths.GLOBAL_STATE, FileAccess.WRITE)
	if not file is FileAccess:
		return

	var json_string: String = state.to_json()
	file.store_string(json_string)
