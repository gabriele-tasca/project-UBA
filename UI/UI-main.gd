extends Control

onready var nav_history = [$root_vbox]

onready var texrect_color = $customize_vbox/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/PanelContainer/MarginContainer/HBoxContainer/TextureRectColor
onready var texrect_color2 = $customize_vbox/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/PanelContainer2/MarginContainer/HBoxContainer/TextureRectColor2

onready var panel_color = $customize_vbox/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/PanelContainer
onready var panel_color2 = $customize_vbox/PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/PanelContainer2

onready var color_picker = $customize_vbox/PanelContainer/MarginContainer/VBoxContainer/ColorPicker

var tutorial_shown = false
onready var tutorial_button = $root_vbox/tutorial_button
# Called when the node enters the scene tree for the first time.
func _ready():
	for vbox in get_children():
		vbox.visible = false
	$root_vbox.visible = true
	
	texrect_color.modulate = Color(Global.own_char_data.color)
	texrect_color2.modulate = Color(Global.own_char_data.color2)

	focus_color(1)

func nav_to_child_subm(new_subm):
	nav_history[-1].visible = false
	nav_history.push_back(new_subm)
	nav_history[-1].visible = true

func nav_to_parent_subm():
	nav_history[-1].visible = false
	nav_history.pop_back()
	nav_history[-1].visible = true


func _on_back_button_pressed():
	nav_to_parent_subm()

var focused_color

func focus_color(id):
	focused_color = id
	if focused_color == 1:
		panel_color.modulate = Color(1.5,1.5,1.5,1.5)
		panel_color2.modulate = Color(1.0,1.0,1.0,1.0)
		color_picker.set_pick_color(texrect_color.modulate)
	if focused_color == 2:
		panel_color2.modulate = Color(1.5,1.5,1.5,1.5)
		panel_color.modulate = Color(1.0,1.0,1.0,1.0)
		color_picker.set_pick_color(texrect_color2.modulate)
			
var min_alpha = 0.3

func _on_ColorPicker_color_changed(newcolor):
	pass # Replace with function body.
	if newcolor.a < min_alpha: newcolor.a = min_alpha
	if focused_color == 1:
		Global.change_char_color(newcolor)
		texrect_color.modulate = Color(newcolor)
	if focused_color == 2:
		Global.change_char_color2(newcolor)
		texrect_color2.modulate = Color(newcolor)

func _on_Name_text_changed(new_text):
	if new_text == "":
		Global.set_random_name()
	else:
		Global.change_char_name(new_text.left(30))

func _on_room_code_text_changed(new_text):
	Global.room_code = new_text

func _on_create_button_pressed():
	Global.create_game()

func _on_join_button_pressed():
	Global.join_game()


func _on_max_players_spinbox_value_changed(value):
	Global.max_players = value


func _on_quit_button_pressed():
	get_tree().notification(MainLoop.NOTIFICATION_WM_QUIT_REQUEST)


func _on_PanelContainer_focus_entered():
	panel_color.modulate = Color(1.5, 1.5, 1.5, 1.5)

func _on_PanelContainer_focus_exited():
	panel_color.modulate = Color(1.0, 1.0, 1.0, 1.0)




func _on_tutorial_button_pressed():
	tutorial_shown = !tutorial_shown
	if tutorial_shown == true:
		tutorial_button.text = "HIDE TUTORIAL"
		Global.spawn_tutorial()
	else:
		tutorial_button.text = "SHOW TUTORIAL"
		Global.despawn_tutorial()
	


func _on_training_button_pressed():
	Global.start_training()
