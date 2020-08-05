extends Area2D

onready var camera = game.get_camera(self)

var speed = 500
onready var sprite : Sprite = get_node("sprite")
onready var anim_player : AnimationPlayer = get_node("anim")
onready var width = sprite.texture.get_width()

var time_alive = 0

func _ready():
	game.score = 0
	game.lifes = 3
	set_process(true)

func _process(delta):
	if time_alive >= 0.1:
		time_alive = 0
		game.score += game.points_for_unit_time
	
	var anim = "idle"
	var dx = 0
	if Input.is_action_pressed("left"):
		sprite.flip_h = true
		dx = -1
	if Input.is_action_pressed("right"):
		sprite.flip_h = false
		dx = 1

	if (global_position.x + (dx * speed * delta)) >= (width / 2) and (global_position.x + (dx * speed * delta)) <= (640 - width/2):
		position += Vector2(dx,0) * speed * delta
	
	if dx != 0:
		anim = "running"
	
	time_alive += delta
	
	anim_player.play(anim)
	

func _on_player_area_entered(area):
	if area.is_in_group(game.SPIKES_GROUP):
		game.lifes -= game.lifes_decrease_each_spike
		game.score -= game.score_decrease_each_spike
		
		if game.lifes == 0:
			set_process(false)
			get_node("anim").play("death")
		else:
			set_process(false)
			get_node("anim").play("hit")
			
		
		area.global_position.y = 700
		
		camera.shake_camera()
	elif area.is_in_group(game.GOLDS_GROUP):
		game.score += game.score_increase_each_gold
		get_node("sound_collect_gold").play()
		area.global_position.y = 700
	elif area.is_in_group(game.LIFES_GROUP):
		game.lifes += game.lifes_increase_each_heart
		game.score += game.score_increase_each_heart
		get_node("sound_collect_life").play()
		area.global_position.y = 700
