extends Node

func unpause():
	get_parent().get_tree().paused = false

func _on_btn_play_pressed():
	unpause()
	queue_free()


func _on_btn_quit_pressed():
	unpause()
	get_tree().quit()


func _on_btn_back_to_menu_pressed():
	unpause()
	for obj in get_parent().get_children():
		print(obj.name)
		obj.queue_free()
	screen_ctrl.update_previous_and_current_screen(screen_ctrl.MAIN_MENU_SCREEN)
