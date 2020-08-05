extends Label

func game_over():
	var main = get_parent().get_parent()
	main.get_node("player").set_process(false)
	main.get_node("player/sound_die").play()
	main.get_node("player/anim").play("death")
	
	show()
	get_parent().get_node("btn_restart").show()
	
	game.lifes = game.INITIAL_LIFES
	game.score = 0

	
