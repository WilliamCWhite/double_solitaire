extends Node2D

# defined by scene._ready()
var refs
var player_data
# ------------------------

var stacks_parent_position = Vector2(80, 0)

var stack_spacing = Vector2(30, 0)

var deck_position = Vector2(0, 10)

func _ready():
	refs.stacks_parent = get_node("stacks")
	refs.stacks_parent.position = stacks_parent_position
	
	for i in player_data.stacks.size():
		var stack_scene = preload("res://scenes/stack.tscn")
		refs.stacks.append(stack_scene.instantiate())
		refs.stacks[i].refs = refs
		refs.stacks[i].name = "stack_%d" % i
		refs.stacks[i].stack_data = player_data.stacks[i]
		refs.stacks[i].position = stack_spacing * i
		
		refs.stacks_parent.add_child(refs.stacks[i])
		
	refs.deck = get_node("deck")
	refs.deck.deck_array = player_data.deck
	refs.deck.refs = refs
	refs.deck.position = deck_position
		
func render():
	for stack in refs.stacks:
		stack.render()
	refs.deck.render()
