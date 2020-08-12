extends Node2D

func _ready():
	game.spawner_interval = 0.5

func pause():
	get_tree().paused = true
	screen_ctrl.update_previous_and_current_screen(screen_ctrl.PAUSE_SCREEN)
	
func _on_btn_pause_pressed():
	pause()




