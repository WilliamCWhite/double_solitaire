extends Node2D

# defined by player._ready()
var refs
var stack_data
# -------------------------
var build_refs = []

var hidden_to_top_offset = 14

var build_slot_offset = Vector2(0, -16)
	
func render():
	var top_card_sprites_ref = get_node("top_card/top_card_sprites")
	top_card_sprites_ref.refs = refs
	var top_index = stack_data.build_pile.size() - 1
	
	var top_card_suit = stack_data.build_pile[top_index].suit
	var top_card_number = int(stack_data.build_pile[top_index].number)
	
	top_card_sprites_ref.render(top_card_suit, top_card_number)
		
		
	if stack_data.hidden_pile.size() > 0:
		top_card_sprites_ref.position.y += stack_data.hidden_pile.size()
		
		var hidden_pile_sprite_ref = get_node("hidden_pile/pile_sprite")
		hidden_pile_sprite_ref.texture = refs.sprite_handler.hiddens[stack_data.hidden_pile.size()]
		hidden_pile_sprite_ref.position.y += -1 * hidden_to_top_offset
		
	for i in stack_data.build_pile.size() - 1:
		var build_scene = load("res://scenes/build_slot_sprites.tscn")
		build_refs.append(build_scene.instantiate())
		var build_suit = stack_data.build_pile[i].suit
		var build_number = stack_data.build_pile[i].number
		build_refs[i].position = (build_slot_offset) + (Vector2(0, 5) * i) + Vector2(0, stack_data.hidden_pile.size())
		build_refs[i].refs = refs
		get_node("build_pile").add_child(build_refs[i])
		build_refs[i].render(build_suit, build_number)
		
	top_card_sprites_ref.position += (Vector2(0, 5) * (stack_data.build_pile.size() - 1))
		
