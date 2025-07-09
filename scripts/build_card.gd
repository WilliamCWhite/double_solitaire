extends Node2D

# Visual Parameters
var card_suit_position = Vector2(-14, 0)
var card_number_position = Vector2(-20, 0)

# Instantiated Externally
var refs

# Instantiated by _ready()
var card_base
var card_suit
var card_number

func _ready():
	card_base = get_node("card_base")
	card_suit = get_node("card_suit")
	card_number = get_node("card_number")
	
	card_suit.position = card_suit_position
	card_number.position = card_number_position
	self.scale = Vector2(0.5, 0.5)

## When passed a card object, renders build card sprites based on the object
func render(card_obj):
	if card_obj == null:
		unrender()
	
	var number = card_obj.number
	var suit = card_obj.suit
	
	if number == 0:
		card_base.texture = null
		card_suit.texture = null
		card_number.texture = null
		return
	
	card_base.texture = refs.sprites.build_outline
	card_suit.texture = determine_suit_texture(suit)
	
	if suit == "H" or suit == "D":
		card_number.texture = refs.sprites.build_red_numbers[number]
	else:
		card_number.texture = refs.sprites.build_black_numbers[number]
	return
	
func unrender():
	card_base.texture = null
	card_suit.texture = null
	card_number.texture = null


func determine_suit_texture(suit):
	var suit_texture
	match suit:
		"H":
			suit_texture = refs.sprites.build_hearts
		"D":
			suit_texture = refs.sprites.build_diamonds
		"S":
			suit_texture = refs.sprites.build_spades
		"C":
			suit_texture = refs.sprites.build_clubs
	return suit_texture
