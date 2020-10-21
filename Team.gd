extends Reference

class_name Team

var Game = load("res://Game.gd")
var RunPlay = load("res://plays/offense/RunPlay.gd")
var BaseDefense_3_4 = load("res://plays/defense/BaseDefense_3_4.gd")

var name
var roster
var coach


func get_offensive_play(game:Game):
	return RunPlay.new()
	
func get_defensive_play(game:Game):
	return BaseDefense_3_4.new()

