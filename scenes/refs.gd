extends Node

# immediately available
var scene
var event_handler
var sprite_handler

var ace_slots_parent

# availabile from scene
var player
var ace_slots = []

# available from player
var stacks_parent
var stacks = []
var deck

func _ready():
	scene = get_node("..")
	event_handler = get_node("../event_handler")
	sprite_handler = get_node("../sprite_handler")
	
	ace_slots_parent = get_node("../ace_slots")
