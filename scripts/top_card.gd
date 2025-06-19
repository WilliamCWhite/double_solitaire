extends Node2D

var suit = ""
var number = 0

var outline_sprite_ref
var suit_sprite_ref
var number_sprite_ref

func initialize_sprites():
	print("initializing sprites")
	print(suit, number)
	outline_sprite_ref = get_node("outline")
	suit_sprite_ref = get_node("suit")
	number_sprite_ref = get_node("number")
	
	var outline_texture = load("res://sprites/card_outline.png")
	outline_sprite_ref.texture = outline_texture
	
	var color = ""
	var suit_texture
	
	match suit:
		"H":
			suit_texture = load("res://sprites/hearts.png")
			color = "red"
		"D":
			suit_texture = load("res://sprites/diamonds.png")
			color = "red"
		"S":
			suit_texture = load("res://sprites/spades.png")
			color = "black"
		"C":
			suit_texture = load("res://sprites/clubs.png")
			color = "black"
	suit_sprite_ref.texture = suit_texture
	
	var number_texture_string = "%s_%d" % [color, number]
	var number_texture_path = "res://sprites/%s.png" % number_texture_string
	var number_texture = load(number_texture_path)
	number_sprite_ref.texture = number_texture
	
