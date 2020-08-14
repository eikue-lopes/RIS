extends Node2D

func _ready():
	game.spawner_interval = 0.5
	var bg = preloads.bg_selected.instance()
	add_child(bg)

func pause():
	get_tree().paused = true
	screen_ctrl.update_previous_and_current_screen(screen_ctrl.PAUSE_SCREEN)
	
func _on_btn_pause_pressed():
	pause()




