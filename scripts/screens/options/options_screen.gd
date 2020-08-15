extends Node



func _on_btn_back_to_main_menu_pressed():
	screen_ctrl.update_previous_and_current_screen(screen_ctrl.MAIN_MENU_SCREEN)
	queue_free()



func _on_select_bg_item_selected(index):
	if index == 0:
		preloads.bg_selected = preloads.pre_background_mountain
	elif index == 1:
		preloads.bg_selected = preloads.pre_background_city
	elif index == 2:
		preloads.bg_selected = preloads.pre_background_forest
