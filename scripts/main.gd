extends Node2D

var game_paused = false 

func _ready():
	get_node("gui/btn_pause").pause()
	game_paused = true

func _on_btn_play_pressed():
	get_node("gui/btn_play").play()
	game_paused = false

func _on_btn_restart_pressed():
	get_node("gui/btn_restart").restart()
	game_paused = false

func _on_btn_pause_pressed():
	get_node("gui/btn_pause").pause()
	game_paused = true


func _process(delta):
	if game.lifes == 0:
		get_node("gui/game_over_label").game_over()

