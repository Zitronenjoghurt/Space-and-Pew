extends Node

var logic_interface: LogicInterface

func _ready() -> void:
	var global_state_string: String = SaveManager.load_global_state()
	logic_interface = LogicInterface.load(global_state_string)
