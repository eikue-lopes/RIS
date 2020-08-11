extends Node

func _on_btn_play_pressed():
	screen_ctrl.update_previous_and_current_screen(screen_ctrl.MAIN_SCREEN)
	queue_free()


func _on_btn_config_pressed():
	screen_ctrl.update_previous_and_current_screen(screen_ctrl.OPTIONS_SCREEN)
	queue_free()
