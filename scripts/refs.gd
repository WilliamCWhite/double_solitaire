extends Node

# Set in _ready()
var scene
#var event_handler
var sprites

func _ready():
	scene = get_node("..")
	sprites = get_node("../sprites")
