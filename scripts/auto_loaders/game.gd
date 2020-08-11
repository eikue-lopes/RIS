extends CanvasLayer

const LIFES_GROUP = "LIFES"
const SPIKES_GROUP = "SPIKES"
const GOLDS_GROUP = "GOLDS"
const COINS_GROUP = "COINS"
var aux_time_wind = 0

const INITIAL_LIFES = 3
const MAX_LIFES = 5

var spawner_interval = 0.5
var interval_decrease = 0.05
var num_spikes_for_interval = 100
var min_interval = 0.1
var points_for_unit_time = 1
var probability_item_life = 0.05
var probability_item_gold = 0.75
var probability_item_coin = 0.05

const LEVEL_SHOW_COINS = 5
const LEVEL_SHOW_LIFES = 3

var score_increase_each_gold = 50
var score_increase_each_coin = 500
var score_increase_each_heart = 10
var lifes_increase_each_heart = 1
var lifes_decrease_each_spike = 1
var score_decrease_each_spike = 10

signal wind_direction_changed


var wind_direction = 0 setget set_wind_direction
func set_wind_direction(value):
	wind_direction = value
	emit_signal("wind_direction_changed")
	
var wind_speed = 50
var wind_time_duration = 1
var time_shake_camera = 3

#hud
var score = 0 setget set_score
var level = 1 setget set_level
var lifes = INITIAL_LIFES setget set_lifes


func reset():
	self.lifes = self.INITIAL_LIFES
	self.score = 0
	self.level = 1
	self.spawner_interval = 0.5

signal score_changed
signal lifes_changed
signal level_changed

func set_score(value):
	if value >= 0:
		score = value
		emit_signal("score_changed")
	else:
		score = 0
		emit_signal("score_changed")

func set_level(value):
	if value > 0:
		level = value
		emit_signal("level_changed")

func set_lifes(value):
	if value >= 0 and value <= MAX_LIFES:
		lifes = value
		emit_signal("lifes_changed")

func get_camera(spike):
	return spike.get_parent().get_node("camera")

func _ready():
	set_process(true)

func _process(delta):
	if aux_time_wind >= wind_time_duration:
		randomize()
		self.wind_direction = round(rand_range(-1,1))
		self.wind_speed = rand_range(10,80)
		aux_time_wind = 0
	
	aux_time_wind += delta
	
	if int(self.score / 1000) > self.level:
		self.level = int(self.score / 1000)
	
