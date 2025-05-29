extends Node2D
class_name TurnManager

## keeps track of the current round
var current_round: int = 1
## keeps track of the turn number within the round
var current_turn: int = 1

var survivors: Array[Survivor] = []
var enemies: Array[Enemy] = []

## Turn queue order (never written, used to update the active turn queue)
var turn_queue_template: Array[Entity]
## Actual turn queue, front popped when its turn is called
var active_turn_queue: Array[Entity]

var survivors_were_set = false
var enemies_were_set = false


## Creates the template that'll be used to set the turn queue at the beginning of each round
func create_turn_queue():
	turn_queue_template.append_array(survivors)
	turn_queue_template.append_array(enemies)
	_reset_turn_queue()
	CombatBlackboard.set_current_round(current_round)


## Set the turn queue back to its default start of round order
func _reset_turn_queue():
	active_turn_queue = turn_queue_template.duplicate()

## take the next turn by popping the first in queue and executing it's take_turn() function
## checks for round end twice for some reason????/
func _next_turn():
	# check for nothing left in queue
	if active_turn_queue.size() == 0:
		_end_round()
		return
	
	# turn taker is front of queue
	var turn_taker: Entity = active_turn_queue.pop_front()
	turn_taker.take_turn()
	
	# check for nothing left in queue
	if active_turn_queue.size() == 0:
		_end_round()	

## execute end of round tasks
func _end_round():
	current_round += 1
	CombatBlackboard.set_current_round(current_round)
	_reset_turn_queue()
	


## Setup array of survivors to be added to a turn queue
func set_survivors(survivor_scene_array: Array[Survivor]):
	survivors = survivor_scene_array
	survivors_were_set = true
	if _check_if_turn_queue_ready():
		create_turn_queue()


func set_enemies(enemy_scene_array: Array[Enemy]):
	enemies = enemy_scene_array
	enemies_were_set = true
	if _check_if_turn_queue_ready():
		create_turn_queue()


## call after setting survivors/enemies to see if both are ready (and turn queue can be created)
func _check_if_turn_queue_ready() -> bool:
	#TODO
	return survivors_were_set and enemies_were_set


## TESTING
func _on_button_button_down() -> void:
	_next_turn()
