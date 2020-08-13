extends Label

var already_showed = false

func _ready():
	game.connect("broke_high_score",self,"on_broke_high_score")

func on_broke_high_score():
	if already_showed == false:
		get_parent().get_node("anim").play("broke_high_score")
		already_showed = true
		
