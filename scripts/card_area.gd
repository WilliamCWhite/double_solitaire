extends Area2D

var event_handler_ref

signal area_clicked

# set up event listener in event handler
func _ready():
	event_handler_ref = get_node("/root/main_scene/event_handler")
	area_clicked.connect(event_handler_ref._on_area_clicked)

# emit the signal to be read by event_handler's event listener
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		area_clicked.emit(get_parent())
