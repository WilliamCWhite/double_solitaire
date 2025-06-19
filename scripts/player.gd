extends Node2D

var player_data

var stack_refs = []

func _ready():
	print("player scene instantiated!")
	
	for i in player_data.stacks.size():
		var stack_scene = preload("res://scenes/stack.tscn")
		stack_refs.append(stack_scene.instantiate())
		stack_refs[i].name = "stack_%d" % i
		stack_refs[i].stack_data = player_data.stacks[i]
		add_child(stack_refs[i])
		
		stack_refs[i].position = Vector2(32 * i, 0)
		
	print(stack_refs)
