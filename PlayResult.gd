extends Reference

class_name PlayResult

var o_play_call
var o_player

var d_play_call
var d_player_name

var quarter
var start_time
var down
var distance
var yards_to_opponents_end_zone

var play_direction #right, left of center
var play_yards # 5, -7, 0
var play_duration # number of seconds, ex. 23
var play_points # 0, 6, 3, 2, 1

const text_template = "{o_play_call_desc} {play_yards_desc} {play_result_desc}"

func to_string():
	var play_yards_desc
	if( play_yards > 0 ):
		play_yards_desc = "for a gain of %d" % [play_yards]
	elif( play_yards < 0 ):
		play_yards_desc = "for a loss of %d" % [play_yards]
	else:
		play_yards_desc = "for no gain"
	return text_template.format({"o_play_call_desc": o_play_call.get_result_desc(o_player, play_direction),"play_yards_desc": play_yards_desc})
