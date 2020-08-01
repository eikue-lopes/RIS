extends Area2D

onready var camera = game.get_camera(self)

var speed = 300

func _ready():
	pause_mode = Node.PAUSE_MODE_STOP
	randomize()
	speed = rand_range(200,500)
	position.x = rand_range(0,640)
	position.y = rand_range(-150,-50)
	set_process(true)

func _process(delta):
	position.y += speed * delta
	position.x += (game.wind_direction * game.wind_speed * delta)
	if global_position.y > 1500:
		print("liberando spike da memória...")
		queue_free()


func _on_spike_area_entered(area):
	if area.is_in_group(game.PLAYER_GROUP):
		game.lifes -= game.lifes_decrease_each_spike
		game.score -= game.score_decrease_each_spike
		
		if game.lifes == 0:
			area.set_process(false)
			area.get_node("anim").play("death")
		else:
			area.set_process(false)
			area.get_node("anim").play("hit")
			
		
		global_position.y = 700
		
		camera.shake_camera()
		

