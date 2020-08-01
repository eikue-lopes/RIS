extends Node2D

onready var pre_spike = preload("res://scenes/spike.tscn")
onready var pre_life_item = preload("res://scenes/item_life.tscn")
onready var pre_gold_item = preload("res://scenes/item_gold.tscn")
var time = 0.0
var count  = 0


func _ready():
	set_process(true)
	randomize()
	
func _process(delta):
	if time >= game.spawner_interval:
		var spike = pre_spike.instance()
		get_parent().add_child(spike)
		time = 0.0
		count += 1
		randomize()
		var r = rand_range(0,1)
		if r <= game.probability_item_life:
			var item_life = pre_life_item.instance()
			get_parent().add_child(item_life)
		if r <= game.probability_item_gold:
			var item_gold = pre_gold_item.instance()
			get_parent().add_child(item_gold)
		
	if count > game.num_spikes_for_level and game.spawner_interval - game.interval_decrease > game.min_interval:
		game.spawner_interval -= game.interval_decrease
		count = 0
	
	print(game.spawner_interval)
	time += delta
