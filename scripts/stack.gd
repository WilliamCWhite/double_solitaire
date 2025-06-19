extends Node2D

var stack_data

func _ready():
	print(stack_data)
	populate_sprites()
	
func populate_sprites():
	var suit = stack_data.build_pile[0].suit
	var number = int(stack_data.build_pile[0].number)
	var top_card_sprites_ref = get_node("top_card/top_card_sprites")
	top_card_sprites_ref.suit = suit
	top_card_sprites_ref.number = number
	top_card_sprites_ref.initialize_sprites()
		
	if stack_data.hidden_pile.size() > 0:
		top_card_sprites_ref.position.y += stack_data.hidden_pile.size() + 1
		var hidden_pile_texture_path = "res://sprites/hidden_%d.png" % stack_data.hidden_pile.size()
		var hidden_pile_texture = load(hidden_pile_texture_path)
		var hidden_pile_sprite_ref = get_node("hidden_pile/pile_sprite")
		hidden_pile_sprite_ref.texture = hidden_pile_texture
		hidden_pile_sprite_ref.position.y += -23 + stack_data.hidden_pile.size()
		
		
		
		
		
