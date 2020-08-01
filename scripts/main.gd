extends Node2D

var game_paused = false 

func pause():
	get_tree().paused = true
	get_node("gui/btn_play").show()
	get_node("gui/btn_pause").hide()
	game_paused = true

func play():
	get_tree().paused = false
	get_node("gui/btn_play").hide()
	get_node("gui/btn_pause").show()
	game_paused = false

func _ready():
	pause()
	

func _on_btn_play_pressed():
	play()


func _on_btn_pause_pressed():
	pause()

func _process(delta):
	if Input.is_action_just_pressed("play_pause"):
		if game_paused:
			play()
		else:
			pause()
