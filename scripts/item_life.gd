extends Area2D

var speed = 200

func _on_item_life_area_entered(area):
	if area.is_in_group(game.PLAYER_GROUP):
		game.lifes += game.lifes_increase_each_heart
		game.score += game.score_increase_each_heart
		get_node("sound").play()
		global_position.y = 700

func _ready():
	pause_mode = Node.PAUSE_MODE_STOP
	position.x = rand_range(0,640)
	position.y = rand_range(-150,-50)
	set_process(true)
	get_node("anim").play("pulse")

func _process(delta):
	position.y += speed * delta
	position.x += (game.wind_direction * game.wind_speed * delta)
	if global_position.y > 1500:
		print("liberando item life da memória...")
		queue_free()


