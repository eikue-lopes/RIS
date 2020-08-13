extends Label

const DIR_FILE = "user://saves.data"

func save_high_score():
	var f = File.new()
	var error = f.open(DIR_FILE,File.WRITE)
	if error:
		print("Erro ao tentar salvar High Score!")
	else:
		f.store_var(game.high_score)
	
	f.close()

func load_high_score():
	var f = File.new()
	var error = f.open(DIR_FILE,File.READ)
	if error:
		game.high_score = 0
	else:
		game.high_score = f.get_var()
	
	f.close()


func _ready():
	set_process(true)
	game.connect("high_score_changed",self,"on_high_score_changed")
	load_high_score()

func _process(delta):
	if game.score > game.high_score:
		game.high_score = game.score
		save_high_score()

func on_high_score_changed():
	if game.high_score >= 10000:
		text = "hi-score " + str(game.high_score / 1000) + "K"
	else:
		text = "hi-score " + str(game.high_score)
