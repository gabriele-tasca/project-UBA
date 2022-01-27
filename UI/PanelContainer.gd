extends PanelContainer

export var id: int

func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			self.owner.get_node("UI_main").focus_color(self.id)

