extends Node

const START_SCREEN = "Start Screen"
const MAIN_MENU_SCREEN = "Main Menu Screen"
const MAIN_SCREEN = "Main Screen"
const PAUSE_SCREEN = "Pause Screen"
const GAME_OVER_SCREEN = "Game Over Screen"
const OPTIONS_SCREEN = "Options Screen"

var previous_screen setget set_previous_screen
var current_screen setget set_current_screen

signal previous_screen_changed
signal current_screen_changed


func set_previous_screen(new_previous_screen):
	previous_screen = new_previous_screen
	emit_signal("previous_screen_changed")

func set_current_screen(new_current_screen):
	current_screen = new_current_screen
	emit_signal("current_screen_changed")
	
func update_previous_and_current_screen(new_current_screen):
	self.set_previous_screen(current_screen)
	self.set_current_screen(new_current_screen)



