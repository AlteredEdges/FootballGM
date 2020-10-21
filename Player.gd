extends Reference

class_name Player

var first_name = "Jim"
var last_name = "Roberts"
var number = 34

func get_full_name():
	return "%s %s" % [first_name, last_name]
