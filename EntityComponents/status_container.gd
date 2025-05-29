extends Node
class_name StatusContainer


func add_status(status: Status):
	var duplicate_status = get_status(status.get_id())
	# if status exists already, add stacks or ignore (depending on is_stackable)
	if duplicate_status:
		if not duplicate_status.is_stackable:
			#TODO status exists and isn't stackable so do nothing?
			return
		
		duplicate_status.add_stacks(status.get_stacks())
		return
	
	# if status doesn't exist, add it
	add_child(status)


func get_status(id: StatusDatabase.StatusID) -> Status:
	for child in get_children():
		# ignore non-Status children
		if not child is Status:
			continue
		
		child = child as Status
		if child.get_id() == id:
			return child
	
	return null
