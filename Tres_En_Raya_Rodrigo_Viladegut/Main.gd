extends Node2D

var array=[["-", "-", "-"],
		   ["-", "-", "-"],
		   ["-", "-", "-"]]
var jugador ="X"
var score_j_1=0
var score_j_2=0

signal limpiar_casillas()
signal text_change_0(player)
signal text_change_1(player)
signal text_change_2(player)
signal text_change_3(player)
signal text_change_4(player)
signal text_change_5(player)
signal text_change_6(player)
signal text_change_7(player)
signal text_change_8(player)
signal score_change(new_score_1, new_score_2)

func _botones(fila,columna):
		
	if array[fila][columna] == "-":
		array[fila][columna]=jugador
		print(array)
		_revisar_array(jugador)
		_cambiar_jugador()
		
		if array==[["-", "-", "-"],["-", "-", "-"],["-", "-", "-"]]:
			jugador="X"

func _on_0_button_up():
	emit_signal("text_change_0",jugador)
	_botones(0,0)
	
func _on_1_button_up():
	emit_signal("text_change_1",jugador)
	_botones(0,1)
func _on_2_button_up():
	emit_signal("text_change_2",jugador)
	_botones(0,2)
func _on_3_button_up():
	emit_signal("text_change_3",jugador)
	_botones(1,0)
func _on_4_button_up():
	emit_signal("text_change_4",jugador)
	_botones(1,1)

func _on_5_button_up():
	emit_signal("text_change_5",jugador)
	_botones(1,2)

func _on_6_button_up():
	emit_signal("text_change_6",jugador)
	_botones(2,0)

func _on_7_button_up():
	emit_signal("text_change_7",jugador)
	_botones(2,1)

func _on_8_button_up():
	emit_signal("text_change_8",jugador)
	_botones(2,2)
	
	
	
func _cambiar_jugador():
	if jugador == "X":
		jugador="O"
	else:
		jugador = "X"
		
		
func _player_gana(player):
	var win = null

	var n = 3

	#Filas
	for i in range(n):
		win = true
		for j in range(n):
			if array[i][j] != player:
				win = false
				break
		if win:
			return win

	#Columnas
	for i in range(n):
		win = true
		for j in range(n):
			if array[j][i] != player:
				win = false
				break
		if win:
			return win
	#Diagonales
	win = true
	for i in range(n):
		if array[i][i] != player:
			win = false
			break
	if win:
		return win
	win = true
	for i in range(n):
		if array[i][n - 1 - i] != player:
			win = false
			break
	if win:
		return win
	return false
	
	for fila in array:
		for item in fila:
			if item == '-':
				return false
	return true

func _array_lleno():
	for fila in array:
		for item in fila:
			if item == '-':
				return false
	return true
	
func _revisar_array(ganador):
	if _array_lleno():
		array=[["-", "-", "-"],
		   ["-", "-", "-"],
		   ["-", "-", "-"]]
		
		print("Empate")
		emit_signal("limpiar_casillas")
		jugador="X"
	if _player_gana(ganador):
		if ganador ==  "X":
			score_j_1+=1
		else:
			score_j_2+=1
		emit_signal("score_change",score_j_1,score_j_2)
		print("Gana: "+ganador)
		emit_signal("limpiar_casillas")
		jugador="X"
		array=[["-", "-", "-"],
		   ["-", "-", "-"],
		   ["-", "-", "-"]]
		
		
		







