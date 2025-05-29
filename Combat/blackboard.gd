extends Node
class_name Blackboard
## TODO CURRENTLY OBSELETE, USING CombatBlackboard AUTOLOAD!!!

## utilizes the blackboard pattern to provide entities with game state information
## should be a child of the game manager, and passed to entities through dependency injection
## SET values with CombatManager and similar game-wide scenes
## GET values with entities (read only)

var _survivors: Array[Survivor] # the survivors in battle
var _enemies: Array[Enemy] # the enemies in battle
var _current_round: int # the round number


# setters


## Sets the array of survivor scenes currently in battle
func set_survivors(survivor_array: Array[Survivor]):
	_survivors = survivor_array


## Sets the array of enemy scenes currently in battle
func set_enemies(enemy_array: Array[Enemy]):
	_enemies = enemy_array


## Sets the current round of battle
func set_current_round(round_number: int):
	_current_round = round_number


# getters

## Returns the number of enemies that have been defeated this combat
func get_num_defeated_enemies() -> int:
	#TODO
	return 1


## Returns the number of allies that have been defeated this combat
func get_num_defeated_survivors() -> int:
	#TODO
	return 1


## Returns the number of enemies remaining this combat
func get_num_remaining_enemies() -> int:
	#TODO
	return _enemies.size()


## Returns the number of survivors remaining this combat (self included)
func get_num_remaining_survivors() -> int:
	#TODO
	return _survivors.size()


## Returns the battle's current round
func get_current_round() -> int:
	return _current_round
