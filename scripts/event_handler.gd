extends Node

var source_card = null

signal animate_event

func _on_area_clicked(node_ref) -> void:
	if source_card == null:
		source_card = node_ref
		return
	
	var destination_card = node_ref
	
	if !validate_cards(source_card, destination_card):
		print("invalid combo")
		source_card = null
		destination_card = null
		return
		
	var event = "move"

	animate_event.connect(source_card._on_animate_event)
	animate_event.emit(event, source_card, destination_card)
	animate_event.disconnect(source_card._on_animate_event)
	
	source_card = null


func validate_cards(source_card, destination_card):
	return true
