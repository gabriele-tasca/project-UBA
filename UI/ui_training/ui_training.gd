extends CanvasLayer

onready var hide_button = $MarginContainer/VBoxContainer/hide_button
onready var options_vbox = $MarginContainer/VBoxContainer/options_vbox

onready var bot_button = $MarginContainer/VBoxContainer/options_vbox/gamemode_panel_container/MarginContainer/VBoxContainer/spawn_bot_button
onready var dummy_button = $MarginContainer/VBoxContainer/options_vbox/gamemode_panel_container/MarginContainer/VBoxContainer/spawn_dummy_button
onready var remove_last_button = $MarginContainer/VBoxContainer/options_vbox/gamemode_panel_container/MarginContainer/VBoxContainer/remove_last_button

onready var quit_button = $MarginContainer/VBoxContainer/options_vbox/quit_button


var awaiting_quit_confirmation = false


var shown = true

func _on_hide_button_pressed():
	shown = !shown
	if shown == false: hide_button.text = "MENU"
	else: hide_button.text = "HIDE"
	options_vbox.visible = shown


#func _process(delta):
#	confirm_quitting_button.visible = true
	
func _on_quit_button_pressed():
	Global.return_to_main_menu()
