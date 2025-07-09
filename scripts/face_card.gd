extends Node2D

# Instantiated Externally
var refs

# Instantiated by _ready()
var card_base
var card_suit
var card_number

func _ready():
	print("face card refs")
	print(refs)
	card_base = get_node("card_base")
	card_suit = get_node("card_suit")
	card_number = get_node("card_number")

## When passed a card object, renders face card sprites based on the card
func render(card_obj):
	print("face card refs")
	print(refs)
	if card_obj == null:
		unrender()
	
	var number = card_obj.number
	var suit = card_obj.suit
	
	card_base.texture = refs.sprites.base_card
	card_suit.texture = determine_suit_texture(suit)
	
	if suit == "H" or suit == "D":
		card_number.texture = refs.sprites.red_numbers[number]
	else:
		card_number.texture = refs.sprites.black_numbers[number]
	return

func unrender():
	card_base.texture = null
	card_suit.texture = null
	card_number.texture = null

func determine_suit_texture(suit):
	var suit_texture
	match suit:
		"H":
			suit_texture = refs.sprites.hearts
		"D":
			suit_texture = refs.sprites.diamonds
		"S":
			suit_texture = refs.sprites.spades
		"C":
			suit_texture = refs.sprites.clubs
	return suit_texture
