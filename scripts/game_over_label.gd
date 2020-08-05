extends Label

func game_over():
	get_parent().get_node("btn_pause").pause()
	show()
