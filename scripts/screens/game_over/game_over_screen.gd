extends Node

func _on_btn_restart_pressed():
	screen_ctrl.update_previous_and_current_screen(screen_ctrl.MAIN_SCREEN)
	queue_free()
