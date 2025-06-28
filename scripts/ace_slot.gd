extends Node2D

# defined by scene._ready()
var refs
var slot_data
# -----------------------

var hidden_to_bottom_offset = 14

func render():
	var top_card_sprites_ref = get_node("top_card_sprites")
	top_card_sprites_ref.refs = refs
	
	if slot_data.cards.size() == 0:
		top_card_sprites_ref.render("", 0)
		return
	
	var top_index = slot_data.cards.size() - 1
	
	var top_card_suit = slot_data.cards[top_index].suit
	var top_card_number = int(slot_data.cards[top_index].number)
	
	top_card_sprites_ref.render(top_card_suit, top_card_number)
	
	if slot_data.cards.size() > 1:
		var hidden_count = determine_hidden_stack_count(slot_data.cards.size() - 1)
		top_card_sprites_ref.position.y -= hidden_count
		
		var hidden_texture_path = "res://sprites/hidden_elements/hidden_%d.png" % hidden_count
		var hidden_texture = load(hidden_texture_path)
		var hidden_sprite_ref = get_node("hidden_sprite")
		hidden_sprite_ref.texture = hidden_texture
		hidden_sprite_ref.position.y += 1 * hidden_to_bottom_offset
		hidden_sprite_ref.z_index = -1

func determine_hidden_stack_count(cards_hidden):
	if cards_hidden <= 6:
		return cards_hidden
	if cards_hidden <= 8:
		return 7
	if cards_hidden <= 10:
		return 8
	return 9
