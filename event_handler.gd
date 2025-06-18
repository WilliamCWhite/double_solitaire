extends Node

var has_source = false
var source_card = null

signal animate_card

func _on_card_clicked(source) -> void:
	has_source = true
	source_card = source


func _on_slot_clicked() -> void:
	if !has_source:
		print("no source")
		return
	animate_card.emit(source_card)
	has_source = false
	source_card = null
	
