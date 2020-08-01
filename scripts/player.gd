extends Area2D


var speed = 500
onready var sprite : Sprite = get_node("sprite")
onready var anim_player : AnimationPlayer = get_node("anim")
onready var width = sprite.texture.get_width()

var time_alive = 0

func _ready():
	game.score = 0
	game.lifes = 3
	add_to_group("player")
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
	
