extends Node2D

var refs

func render(suit, number):
	var outline_sprite_ref = get_node("outline")
	var suit_sprite_ref = get_node("suit")
	var number_sprite_ref = get_node("number")
	
	if number == 0:
		outline_sprite_ref.texture = refs.sprite_handler.slot_outline
		return
	outline_sprite_ref.texture = refs.sprite_handler.base_card
	
	var color = ""
	var suit_texture
	
	match suit:
		"H":
			suit_texture = refs.sprite_handler.hearts
			color = "red"
		"D":
			suit_texture = refs.sprite_handler.diamonds
			color = "red"
		"S":
			suit_texture = refs.sprite_handler.spades
			color = "black"
		"C":
			suit_texture = refs.sprite_handler.clubs
			color = "black"
	suit_sprite_ref.texture = suit_texture
	
	if color == "red":
		number_sprite_ref.texture = refs.sprite_handler.red_numbers[number]
	elif color == "black":
		number_sprite_ref.texture = refs.sprite_handler.black_numbers[number]
