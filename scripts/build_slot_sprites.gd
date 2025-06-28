extends Node

var refs

var number_offset = Vector2(-20, 0)
var suit_offset = Vector2(-12, 0)


func render(suit, number):
	self.scale = Vector2(0.5, 0.5)
	
	var outline_sprite_ref = get_node("outline")
	var suit_sprite_ref = get_node("suit")
	var number_sprite_ref = get_node("number")
	
	outline_sprite_ref.texture = refs.sprite_handler.build_outline
	
	var color = ""
	var suit_texture
	
	match suit:
		"H":
			suit_texture = refs.sprite_handler.build_hearts
			color = "red"
		"D":
			suit_texture = refs.sprite_handler.build_diamonds
			color = "red"
		"S":
			suit_texture = refs.sprite_handler.build_spades
			color = "black"
		"C":
			suit_texture = refs.sprite_handler.build_clubs
			color = "black"
	suit_sprite_ref.texture = suit_texture
	suit_sprite_ref.position = suit_offset
	
	if color == "red":
		number_sprite_ref.texture = refs.sprite_handler.build_red_numbers[number]
	elif color == "black":
		number_sprite_ref.texture = refs.sprite_handler.build_black_numbers[number]
	number_sprite_ref.position = number_offset
