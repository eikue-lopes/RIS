extends Node2D

func _ready():
	game.spawner_interval = 0.5

func _on_btn_pause_pressed():
	get_node("gui/btn_pause").pause()




