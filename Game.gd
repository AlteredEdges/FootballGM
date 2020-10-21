extends Reference

class_name Game

var Team = load("res://Team.gd")

var home_team
var away_team

var plays:Array

const QUARTERS_IN_GAME = 4
const SECONDS_IN_QUARTER = 900

var current_quarter
var time_remaining_in_quarter

func _init():
	print("Gane init...")
	current_quarter = 1;
	time_remaining_in_quarter = 900

func is_quarter_over():
	return time_remaining_in_quarter == 0
	
func next_quarter():
	current_quarter += 1
	time_remaining_in_quarter = SECONDS_IN_QUARTER
	
func is_game_over():
	return current_quarter == QUARTERS_IN_GAME && time_remaining_in_quarter == 0

