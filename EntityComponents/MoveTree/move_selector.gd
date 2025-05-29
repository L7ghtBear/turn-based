@icon("res://Assets/MoveTreeIcon/Selector.svg")
extends Node
class_name MoveSelector

const RECHECK_LIMIT = 20

## array to check last used moves
var overuse_move_array: Array[Move] = []
## checks how many times move has been rechecked
## if over 10, stop rechecking to prevent infinite recursion
var recheck_iteration_counter: int = 0

## Sort through children to find first valid move, then use it
func execute_move(entity: Entity):
	# parse through children, checking for conditions
	for child in get_children():
		if child is MoveCondition:
			var move = child.evaluate(entity)
			
			if move:
				if _move_is_overused(move):
					# call recursively
					execute_move(entity)
					return
				move.execute(entity)
				return
		
		# if "free-floating" MoveCaller, assume it has no condition and call it
		if child is MoveCaller:
			var move = child.get_move()
			if _move_is_overused(move):
				# call recursively
				execute_move(entity)
				return
			move.execute(entity)
			return


## checks a move to see if has already been used
## return if move IS overused
func _move_is_overused(move: Move) -> bool:
	# nothing in array, add as first, good to go (don't check limit of 0)
	if overuse_move_array.size() == 0:
		overuse_move_array.append(move)
		return false
	
	# not in array, move is different so pass it and reset array and counter
	if not move in overuse_move_array:
		overuse_move_array.clear()
		recheck_iteration_counter = 0
		overuse_move_array.append(move)
		return false
	
	# move is in array, check limit
	else:
		
		# uses doesn't pass limit, good to go
		if overuse_move_array.size() < move.limit:
			overuse_move_array.append(move)
			return false
		
		# use exceeds limit, check recursion
		else:
			
			# no infinite recursion, stop
			if recheck_iteration_counter <= RECHECK_LIMIT:
				overuse_move_array.append(move)
				recheck_iteration_counter += 1
				return true
			
			# (maybe) infinite recursion, allow
			else:
				overuse_move_array.clear()
				recheck_iteration_counter = 0
				overuse_move_array.append(move)
				print("reset for recursion ", overuse_move_array)
				return false
	
	
