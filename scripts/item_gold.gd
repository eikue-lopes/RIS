extends Area2D

var speed = 250

func _ready():
	pause_mode = Node.PAUSE_MODE_STOP
	position.x = rand_range(0,640)
	position.y = rand_range(-150,-50)
	set_process(true)
	get_node("anim").play("pulse")
	add_to_group(game.GOLDS_GROUP)

func _process(delta):
	position.y += speed * delta
	position.x += (game.wind_direction * game.wind_speed * delta)
	if global_position.y > 1500:
		print("liberando item gold da memória...")
		queue_free()
