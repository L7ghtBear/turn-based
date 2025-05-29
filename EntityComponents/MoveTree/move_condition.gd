@icon("res://Assets/MoveTreeIcon/Condition.svg")
extends Node
class_name MoveCondition

## Determines whether the condition is valid, and it's children can be looked at (or executed).
## Override this in inherited conditions
func is_valid(entity: Entity) -> bool:
	# override in inherited MoveConditions
	return true

## If the condition is true, check for a valid move to be used by the MoveSelector
## If there are more conditions, run their evaluate functions
## If there is a valid move, return it
## If there is no valid move, or the condition fails, return null (MoveSelector will check the next condition)
func evaluate(entity: Entity) -> Move:
	# Return null if test fails
	if not is_valid(entity):
		#print(self, " is invalid")
		return null
	#print(self, " is valid, checking children")
	
	# Iterate though children in order for first move
	for child in get_children():
		# Nested condition, run equation pseudo-recursively until move found (or none)
		if child is MoveCondition:
			var move = child.evaluate(entity)
			if move:
				return move
		# Child is MoveCaller, return its move
		elif child is MoveCaller:
			return child.get_move()
	
	# No valid condition or child found, skip this condition
	return null
	
