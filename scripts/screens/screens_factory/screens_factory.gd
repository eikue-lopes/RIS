extends Node

var pre_start_screen  = preload("res://scenes/screens/start_screen.tscn")
var pre_main_menu_screen = preload("res://scenes/screens/main_menu_screen.tscn")
var pre_main_screen  = preload("res://scenes/screens/main_screen.tscn")
var pre_pause_screen = preload("res://scenes/screens/pause_screen.tscn")
var pre_game_over_screen = preload("res://scenes/screens/game_over_screen.tscn")
var pre_options_screen = preload("res://scenes/screens/options_screen.tscn")
func _ready():
	screen_ctrl.connect("current_screen_changed",self,"on_screen_changed")
	screen_ctrl.update_previous_and_current_screen(screen_ctrl.START_SCREEN)

func on_screen_changed():
	if screen_ctrl.current_screen == screen_ctrl.START_SCREEN:
		self.make_start_screen()
	elif screen_ctrl.current_screen == screen_ctrl.MAIN_MENU_SCREEN:
		self.make_main_menu_screen()
	elif screen_ctrl.current_screen == screen_ctrl.MAIN_SCREEN:
		self.make_main_screen()
	elif screen_ctrl.current_screen == screen_ctrl.PAUSE_SCREEN:
		self.make_pause_screen()
	elif screen_ctrl.current_screen == screen_ctrl.GAME_OVER_SCREEN:
		self.make_game_over_screen()
	elif screen_ctrl.current_screen == screen_ctrl.OPTIONS_SCREEN:
		self.make_options_screen()


func make_start_screen():
	var start_screen = pre_start_screen.instance()
	add_child(start_screen)

func make_main_menu_screen():
	var main_menu_screen = pre_main_menu_screen.instance()
	add_child(main_menu_screen)

func make_main_screen():
	var main_screen = pre_main_screen.instance()
	add_child(main_screen)

func make_pause_screen():
	var pause_screen = pre_pause_screen.instance()
	add_child(pause_screen)

func make_game_over_screen():
	var game_over_screen = pre_game_over_screen.instance()
	add_child(game_over_screen)

func make_options_screen():
	var options_screen = pre_options_screen.instance()
	add_child(options_screen)
