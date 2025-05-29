extends Node
class_name Status

@export var id: StatusDatabase.StatusID
@export var is_buff: bool
@export var is_stackable: bool
@export var stacks: int = 1



func get_id():
	return id


func get_stacks():
	return stacks

func add_stacks(amount: int):
	if not is_stackable:
		push_error("Attempting to add stacks to ", self, " which is not stackable")
	
	stacks += amount
