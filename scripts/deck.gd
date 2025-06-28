extends Node2D

# from player._ready()
var refs
var deck_array


var pile_sprite_ref
var back_card_sprite_ref

var hidden_to_bottom_offset = 14

func _ready():
	pile_sprite_ref = get_node("pile")
	back_card_sprite_ref = get_node("back_card")

func render():
	print("render called")
	var deck_size = deck_array.size()
	
	if deck_size == 0:
		print("do logic for empty sprite")
		var back_card_texture = load("res://sprites/card_elements/slot_outline.png")
		back_card_sprite_ref.texture = back_card_texture
		return
		
	var back_card_texture = load("res://sprites/card_elements/deck_back_card.png")
	back_card_sprite_ref.texture = back_card_texture
	
	var pile_count = determine_pile_sprite_size(deck_size)
	
	back_card_sprite_ref.position.y -= pile_count
	
	var hidden_texture_path = "res://sprites/hidden_elements/hidden_%d.png" % pile_count
	var hidden_texture = load(hidden_texture_path)
	pile_sprite_ref.texture = hidden_texture
	pile_sprite_ref.position.y += 1 * hidden_to_bottom_offset
	pile_sprite_ref.z_index = -1
	
	
func determine_pile_sprite_size(deck_size):
	# note: max 24 cards in the deck
	if deck_size == 1:
		return 0
	if deck_size == 2:
		return 1
	return deck_size / 3 + 1
