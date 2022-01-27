extends Node

const CHARACTER = preload("res://character/character.tscn")

# THIS HAS TO BE IDENTICAL TO THE ONE IN CHAR (or TODO copy this into global)
enum NET_MODE {own_on_host, other_on_host, own_on_client, other_on_client}
var bots = []
var bot_counter = 0

func clear_bots():
	for k in bots:
		k.queue_free()


func spawn_bot():
	var character = CHARACTER.instance()
	self.add_child(character)
	bot_counter += 1
	character.set_name("bot "+ str(bot_counter))
	character.net_mode = NET_MODE.other_on_host
	character.control_mode = character.CONTROL_MODE.bot
	character.respawn()
	bots.push_back(character)

func spawn_dummy():
	var character = CHARACTER.instance()
	self.add_child(character)
	bot_counter += 1
	character.set_name("dummy "+ str(bot_counter))
	character.net_mode = NET_MODE.other_on_host
	character.control_mode = character.CONTROL_MODE.none
	character.respawn()
	bots.push_back(character)


func remove_last_unit():
	if bots.size() > 0:
		var last = bots.pop_back()
		last.queue_free()



func _on_spawn_bot_button_pressed():
	spawn_bot()

func _on_spawn_dummy_button_pressed():
	spawn_dummy()

func _on_remove_last_pressed():
	remove_last_unit()

