extends Node
class_name Move

## Emitted when the move has finished completing.
## Bubbled up by entity parent to communicate with TurnManager
signal move_finished

## Name of animation to call on entity while using move
@export var animation_name: String
## Max number of times move can be called in a row
@export var limit: int = 3

## Execute the move if possible.
## Override this in inheiriting moves
func execute(entity: Entity):
	pass
