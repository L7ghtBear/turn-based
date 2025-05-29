extends MoveCondition
class_name HasStatusCondition

@export var statusID: StatusDatabase.StatusID

func is_valid(entity: Entity):
	return entity.get_status_instance(statusID) != null
		
