extends Node

var refs

var base_card = preload("res://sprites/card_elements/card_outline.png")
var hearts = preload("res://sprites/card_elements/hearts.png")
var diamonds = preload("res://sprites/card_elements/diamonds.png")
var clubs = preload("res://sprites/card_elements/clubs.png")
var spades = preload("res://sprites/card_elements/spades.png")
var red_numbers = []
var black_numbers = []

var back_card = preload("res://sprites/card_elements/back_card.png")
var deck_back_card = preload("res://sprites/card_elements/deck_back_card.png")
var slot_outline = preload("res://sprites/card_elements/slot_outline.png")

var hiddens = []

var build_outline = preload("res://sprites/build/build_outline.png")
var build_hearts = preload("res://sprites/build/hearts.png")
var build_diamonds = preload("res://sprites/build/diamonds.png")
var build_clubs = preload("res://sprites/build/clubs.png")
var build_spades = preload("res://sprites/build/spades.png")
var build_red_numbers = []
var build_black_numbers = []

func _init():
	for i in range(0, 14):
		red_numbers.append(load("res://sprites/numbers_red/red_%d.png" % i))
		black_numbers.append(load("res://sprites/numbers_black/black_%d.png" % i))
		build_red_numbers.append(load("res://sprites/build/build_numbers/red_%d.png" % i))
		build_black_numbers.append(load("res://sprites/build/build_numbers/black_%d.png" % i))
	for i in range(1, 10):
		hiddens.append(load("res://sprites/hidden_elements/hidden_%d.png" % i))
