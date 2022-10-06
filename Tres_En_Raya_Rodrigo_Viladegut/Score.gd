extends Label

func _on_Main_score_change(new_score_1, new_score_2):
	text= "Jugador 1: "+ str(new_score_1)+ " | Jugador 2: "+ str(new_score_2)
