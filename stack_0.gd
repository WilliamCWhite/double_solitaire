extends Sprite2D


func _on_animate_card(card) -> void:
	print("animate card called")
	if card == self:
		print("card is self")
