extends CanvasLayer

const LIFES_GROUP = "LIFES"
const SPIKES_GROUP = "SPIKES"
const GOLDS_GROUP = "GOLDS"
var aux_time_wind = 0

const INITIAL_LIFES = 1
#difficult controls...
var spawner_interval = 0.5
var interval_decrease = 0.05
var num_spikes_for_level = 100
var min_interval = 0.1
var points_for_unit_time = 1
var probability_item_life = 0.10
var probability_item_gold = 0.50

var score_increase_each_gold = 50
var score_increase_each_heart = 10
var lifes_increase_each_heart = 1
var lifes_decrease_each_spike = 1
var score_decrease_each_spike = 10

signal wind_direction_changed

#scenario variables
var wind_direction = 0 setget set_wind_direction
func set_wind_direction(value):
	wind_direction = value
	emit_signal("wind_direction_changed")
	
var wind_speed = 50
var wind_time_duration = 0.5
var time_shake_camera = 1

var color_hit = "#f90000"

#hud
var score = 0 setget set_score
var lifes = INITIAL_LIFES setget set_lifes
const MAX_LIFES = 5

signal score_changed
signal lifes_changed

func set_score(value):
	if value >= 0:
		score = value
		emit_signal("score_changed")

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
