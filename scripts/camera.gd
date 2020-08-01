extends Camera2D

onready var bg = get_parent().get_node("bg")
onready var player = get_parent().get_node("player")

var shake = 0

func _ready():
	set_process(true)

func _process(delta):
	if shake > 0:
		position = Vector2(cos(rad2deg(shake)),sin(rad2deg(shake)))
		shake -= delta
		bg.modulate = game.color_hit
		if player != null:
			player.modulate = game.color_hit
	if shake < 0:
		bg.modulate = "#ffffff"
		if player != null:
			player.modulate = "#ffffff"
		shake = 0

func shake_camera():
	shake = game.time_shake_camera
