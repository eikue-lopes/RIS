extends Area2D



var speed = 300

func _ready():
	pause_mode = Node.PAUSE_MODE_STOP
	randomize()
	speed = rand_range(200,500)
	position.x = rand_range(0,640)
	position.y = rand_range(-150,-50)
	add_to_group(game.SPIKES_GROUP)
	set_process(true)

func _process(delta):
	position.y += speed * delta
	position.x += (game.wind_direction * game.wind_speed * delta)
	if global_position.y > 1500:
		print("liberando spike da memória...")
		queue_free()


