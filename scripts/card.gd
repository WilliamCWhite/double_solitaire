extends Node

signal animation_ended

func _on_animate_event(event, source_card, destination_card):
	animation_ended.connect(destination_card._on_animation_ended)
	print("animating event", self)
	animation_ended.emit(event, source_card, destination_card)
	animation_ended.disconnect(destination_card._on_animation_ended)
	
func _on_animation_ended(event, source_card, destination_card):
	print("animation ended", self)
