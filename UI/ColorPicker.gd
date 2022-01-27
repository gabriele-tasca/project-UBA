extends ColorPicker

onready var ui_main = get_tree().get_nodes_in_group("UI_main")[0]

export var color_number: int

func _ready():
	connect("color_changed", self, "_on_ColorPicker_color_changed")

func _on_ColorPicker_color_changed(color):
	ui_main.handle_color_picker_change(color, color_number)
