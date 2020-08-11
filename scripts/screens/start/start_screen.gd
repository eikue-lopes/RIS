extends Node



func _on_btn_start_all_screen_pressed():
	screen_ctrl.update_previous_and_current_screen(screen_ctrl.MAIN_MENU_SCREEN)
	queue_free()
