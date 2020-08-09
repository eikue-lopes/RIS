extends Label


func on_score_changed():
	if game.score >= 10000:
		text = str(game.score / 1000) + "K"
	else:
		text = str(game.score)

func _ready():
	game.score = 0
	game.connect("score_changed",self,"on_score_changed")


