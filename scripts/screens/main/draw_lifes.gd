extends Node2D

export var item_life: Texture

func on_lifes_changed():
	update()

func _ready():
	game.connect("lifes_changed",self,"on_lifes_changed")

func _draw():
	for i in range(game.lifes): 
		draw_texture(item_life,Vector2(item_life.get_width() * i,global_position.y))

