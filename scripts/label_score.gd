extends Label


func on_score_changed():
	text = "score: " + str(game.score)

func _ready():
	game.score = 0
	game.connect("score_changed",self,"on_score_changed")


