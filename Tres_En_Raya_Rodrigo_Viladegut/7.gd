extends Button



func _on_Main_text_change_7(player):
	if text == "-":
		text=player


func _on_Main_limpiar_casillas():
	text="-"
