extends Camera2D

var shake = 0

func _ready():
	set_process(true)

func _process(delta):
	if shake > 0:
		position = Vector2(cos(-rad2deg(shake)),sin(-rad2deg(shake)))
		shake -= delta
	else:
		shake = 0

func shake_camera():
	shake = game.time_shake_camera
