extends Node2D

var data

func _init():
	data = load_data()
	
	var player_scene = preload("res://scenes/player.tscn")
	var player_ref = player_scene.instantiate()
	add_child(player_ref)
	player_ref.name = "player_0"
	player_ref.player_data = data.players.player_0
	player_ref.position = Vector2(100, 300)
	player_ref.scale = Vector2(4.0, 4.0)
	

func load_data():
	var file = FileAccess.open("res://data.json", FileAccess.READ)
	if file == null:
		push_error("Failed to open file")
		return
		
	var json_string = file.get_as_text()
	var json_result = JSON.parse_string(json_string)
	
	return json_result
	
