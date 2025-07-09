extends Node2D

# Visual Parameters
var initial_hidden_offset = -14
var initial_build_offset = -16
var pixels_per_build = 5

# Instantiated externally
var refs

# Instantiated in _ready()
var face_card
var flipped_card
var hidden_stack
var stack_slot_outline
var build_sprites = []

func _ready():
	print("stack1 refs")
	print(refs)
	face_card = get_node("sprites/face_card")
	face_card.refs = refs
	flipped_card = get_node("sprites/flipped_card")
	hidden_stack = get_node("sprites/hidden_stack")
	stack_slot_outline = get_node("sprites/stack_slot_outline")
	
	# populate build_sprites with refs to all build sprites
	for i in 12:
		build_sprites.append(get_node("sprites/build_sprites/build_card_%d" % i))
		build_sprites[i].refs = refs


## When given a stack object, renders stack sprites and hitboxes based on this object
func render(stack_obj):
	print("stack refs")
	print(refs)
	var hidden_count = stack_obj.hidden_cards.size()
	var shown_count = stack_obj.shown_cards.size()
	
	# control face card rendering for stacks with and without any shown cards
	if shown_count == 0:
		face_card.unrender()
	else:
		var face_card_obj = stack_obj.shown_cards[shown_count - 1]
		process_face_card_logic(hidden_count, shown_count, face_card_obj)
	
	# includes unrendering of build cards
	process_build_card_logic(hidden_count, shown_count, stack_obj.shown_cards)
	
	process_hidden_card_logic(hidden_count, shown_count)

## positions collision hitboxes
#func render_hitboxes(hidden_count, shown_count):
	


## sets proper sprites for flipped_card, hidden_stack, and stack_slot_outline
func process_hidden_card_logic(hidden_count, shown_count):
	# handle outline sprite
	if hidden_count == 0 and shown_count == 0:
		stack_slot_outline.texture = refs.sprites.slot_outline
	else:
		stack_slot_outline.texture = null
	
	# handle back card sprite
	if hidden_count > 0:
		flipped_card.texture = refs.sprites.back_card
		flipped_card.position = Vector2(0, hidden_count - 1)
	else:
		flipped_card.texture = null
		
	# handle hidden stack sprites
	if hidden_count > 1:
		hidden_stack.position = Vector2(0, initial_hidden_offset)
		hidden_stack.texture = refs.sprites.hiddens[hidden_count - 1]
	else:
		hidden_stack.texture = null


## sets the proper offsets and build_card sprites
func process_build_card_logic(hidden_count, shown_count, shown_cards):
	var build_count = shown_count - 1
	var down_offset = hidden_count + initial_build_offset
	for i in 12:
		# unrender sprites that shouldn't exist
		if i >= build_count:
			build_sprites[i].unrender()
			continue
		
		build_sprites[i].position = Vector2(0, down_offset)
		build_sprites[i].render(shown_cards[i])
		down_offset += pixels_per_build


## sets the proper offset and face_card sprite
func process_face_card_logic(hidden_count, shown_count, face_card_obj):
	var build_count = shown_count - 1
	var down_offset = hidden_count + build_count * pixels_per_build
	face_card.position = Vector2(0, down_offset)
	face_card.render(face_card_obj)
	
