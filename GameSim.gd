extends Node


var Random = load("res://Random.gd")

func _ready():
	var team_sharks = Team.new()
	team_sharks.name = "Sharks"
	var team_cougars = Team.new()
	team_cougars.name = "Cougars"
	var game = new_game(team_sharks, team_cougars)
	simulate_game(game)

func new_game(in_home_team, in_away_team):
	var game = Game.new()
	game.home_team = in_home_team
	game.away_team = in_away_team
	return game

func simulate_game(game):
	while not game.is_game_over():
		if game.is_quarter_over():
			print(">> End quarter " + str(game.current_quarter) )
			game.next_quarter()
		else:
			print(">> Starting quarter " + str(game.current_quarter) )			
			var o_play_call = game.home_team.get_offensive_play(game)
			var d_play_call = game.away_team.get_defensive_play(game)
			var play_result = o_play_call.get_result(d_play_call, game)
			#simulate_play(o_play_call, d_play_call, game)
			print(play_result.to_string())
			game.time_remaining_in_quarter = 0
	print("Game Over!")
	
#	randomize()
#	var r = Random.new()
#	var total = 0
#	for n in range(100):
#		var yards = round(r.normal(2.0,2.0))
#		var broken_tackle = r.normal() > .6
#		while broken_tackle:
#			print("broken tackle")
#			var addition_yards = round(r.normal(6.0,4.0))
#			print(addition_yards)
#			yards += addition_yards
#			broken_tackle = r.normal() > .6
#		print(">",yards)
#		total += yards
#	print( total/100 )
	
#func simulate_play(o_play_call, d_play_call, game):
#	print("... some plays ...")
