extends Node



func _on_btn_play_pressed():
	get_parent().get_node("main_screen").get_tree().paused = false
	print("odfsdkfdlfjdkfjsdfl")
	queue_free()
