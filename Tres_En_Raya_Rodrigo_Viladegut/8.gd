extends Button



func _on_Main_text_change_8(player):
	if text == "-":
		text=player


func _on_Main_limpiar_casillas():
	text="-"
