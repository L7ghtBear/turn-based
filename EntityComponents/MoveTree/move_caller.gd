@icon("res://Assets/MoveTreeIcon/Move.svg")
extends Node
class_name MoveCaller
## Serves as a wrapper that references a move and calls it when iterated over
## Exists so moves don't have to be put into the Decision tree

@export var move: Move

## Return move
func get_move():
	return move
