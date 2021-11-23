extends Node

var score = 0
var save_file = ConfigFile.new()

func save_game():
	save_file.set_value("Player", "score", score)
	var player = get_node_or_null("/root/Game/Player")
	if player != null:
		save_file.set_value("Player", "position", player.position)
	save_file.save("res://save.cfg")
func load_game():
	save_file.load("res://save.cfg")
	score = save_file.get_value("Player", "score")
	var player = get_node_or_null("/root/Game/Player")
	if player != null:
		player.position = save_file.get_value("Player", "position")
