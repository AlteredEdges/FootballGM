extends Reference

class_name RunPlay

var Player = load("res://Player.gd")
var PlayResult = load("res://PlayResult.gd")
var Random = load("res://Random.gd")

var team

func get_result(d_play_call, game):
	var result = PlayResult.new()
	result.o_play_call = self
	result.o_player = Player.new()
	result.d_play_call = d_play_call
	result.d_player_name = Player.new()
	result.quarter = game.current_quarter
	result.start_time = game.time_remaining_in_quarter
	result.down #TODO
	result.distance #TODO
	result.yards_to_opponents_end_zone #TODO
	result.play_direction = "right"
	result.play_yards = calc_yards()
	result.play_duration = 23
	result.play_points = 0
	return result

func calc_yards():
	randomize()
	var r = Random.new()
	var yards = round(r.normal(2.0,2.0))
	var broken_tackle = r.normal() > .6
	while broken_tackle:
		#print("broken tackle")
		var addition_yards = round(r.normal(6.0,4.0))
		#print(addition_yards)
		yards += addition_yards
		broken_tackle = r.normal() > .6
	return yards
	

func get_result_desc(player, direction):
	var dir_text
	if(direction == "right"):
		dir_text = "to the right"
	
	return "%s rushed %s" % [player.get_full_name(), dir_text]

