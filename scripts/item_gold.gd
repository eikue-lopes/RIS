extends Area2D

var speed = 250

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
		print("liberando item gold da memória...")
		queue_free()


func _on_item_gold_area_entered(area):
	if area.is_in_group(game.PLAYER_GROUP):
		game.score *= 2
		get_node("sound").play()
		global_position.y = 700
