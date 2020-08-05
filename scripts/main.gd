extends Node2D

var game_paused = false 

func _ready():
	get_node("gui/btn_pause").pause()
	game_paused = true

func _on_btn_play_pressed():
	get_node("gui/btn_play").play()
	game_paused = false

func play_game():
	_on_btn_play_pressed()

func _on_btn_pause_pressed():
	get_node("gui/btn_pause").pause()
	game_paused = true

func pause_game():
	_on_btn_pause_pressed()

func _process(delta):
	if game.lifes == 0:
		pass
	#	get_node("gui/game_over_label").game_over()
	
	elif Input.is_action_just_pressed("play_pause"):
		if game_paused:
			play_game()
		else:
			pause_game()
