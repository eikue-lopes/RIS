extends CPUParticles2D

func on_wind_direction_changed():
	print("ok")
	gravity.x = game.wind_direction * game.wind_speed

func _ready():
	gravity.x = game.wind_direction * game.wind_speed
	game.connect("wind_direction_changed",self,"on_wind_direction_changed")
	
