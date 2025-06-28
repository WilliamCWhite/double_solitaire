extends Node2D

var refs


var initial_data_path = "res://data.json"
var initial_data = load_initial_data()

var player_position = Vector2(100, 375)
var player_scale = Vector2(4, 4)

var ace_slots_position = Vector2(100, 150)
var ace_slots_scale = Vector2(4, 4)

var slot_spacing = Vector2(30, 0)

var player_ref
var ace_slots_ref
var slot_refs = []

func _init():
	print("scene init")
	
	# Initialize Player
	#var player_scene = preload("res://scenes/player.tscn")
	#player_ref = player_scene.instantiate()
	#add_child(player_ref)
	#player_ref.name = "player_0"
	#player_ref.player_data = initial_data.players.player_0
	#player_ref.scene_ref = self
	#player_ref.position = player_position
	#player_ref.scale = player_scale


func _ready():
	refs = get_node("./refs")
	
	# Initialize Player
	var player_scene = load("res://scenes/player.tscn")
	refs.player = player_scene.instantiate()
	refs.player.refs = refs
	refs.player.player_data = initial_data.players.player_0
	refs.player.position = player_position
	refs.player.scale = player_scale
	# important to add to tree after assigning variables
	add_child(refs.player)
	
	
	# Initialize Ace Slots
	for i in initial_data.ace_slots.size():
		var slot_scene = preload("res://scenes/ace_slot.tscn")
		refs.ace_slots.append(slot_scene.instantiate())
		refs.ace_slots[i].refs = refs
		refs.ace_slots[i].name = "ace_slot_%d" % i
		refs.ace_slots[i].slot_data = initial_data.ace_slots[i]
		refs.ace_slots[i].position = slot_spacing * i
		refs.ace_slots_parent.add_child(refs.ace_slots[i])
	
	refs.ace_slots_parent.position = ace_slots_position
	refs.ace_slots_parent.scale = ace_slots_scale
	
	# Render
	await get_tree().process_frame
	refs.player.render()
	for ace_slot in refs.ace_slots:
		ace_slot.render()


func load_initial_data():
	var file = FileAccess.open(initial_data_path, FileAccess.READ)
	if file == null:
		push_error("Failed to open file")
		return
		
	var json_string = file.get_as_text()
	return JSON.parse_string(json_string)
	
