extends Node2D

var initial_data_path = "res://temp/temp.json"
var data = load_initial_data()

var refs

func _ready():
	refs = get_node("refs")
	
	#var build_card_ref = get_node("build_card")
	#build_card_ref.refs = refs
	#build_card_ref.scale = Vector2(2,2)
	#
	#var card_obj = {}
	#card_obj.suit = "D"
	#card_obj.number = 10
	#build_card_ref.render(card_obj)
	
	for i in range(1, 8):
		var stack_scene = load("res://scenes/stack.tscn")
		var stack = stack_scene.instantiate()
		stack.refs = refs
		stack.position = Vector2(130 * i, 300)
		stack.scale = Vector2(4.0, 4.0)
		self.add_child(stack)
		stack.render(data.stacks[i - 1])
	

func load_initial_data():
	var file = FileAccess.open(initial_data_path, FileAccess.READ)
	if file == null:
		push_error("Failed to open file")
		return
		
	var json_string = file.get_as_text()
	return JSON.parse_string(json_string)
