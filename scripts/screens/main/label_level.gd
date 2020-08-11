extends Label

func on_level_changed():
	text = "Level " + str(game.level)

func _ready():
	game.level = 1
	game.connect("level_changed",self,"on_level_changed")
