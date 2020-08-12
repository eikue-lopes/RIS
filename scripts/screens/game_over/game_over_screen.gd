extends Node

func _on_btn_restart_pressed():
	for obj in get_parent().get_children():
		print(obj.name)
		obj.queue_free()
	screen_ctrl.update_previous_and_current_screen(screen_ctrl.MAIN_SCREEN)


func _on_btn_quit_pressed():
	get_tree().quit()


func _on_btn_back_to_menu_pressed():
	for obj in get_parent().get_children():
		print(obj.name)
		obj.queue_free()
	screen_ctrl.update_previous_and_current_screen(screen_ctrl.MAIN_MENU_SCREEN)

