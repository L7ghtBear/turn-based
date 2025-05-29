extends MoveCondition
class_name ChanceCondition

@export_range(1,100) var percent_chance: int = 100

func is_valid(entity: Entity):
	var random_number = randi_range(1, 100)
	return random_number <= percent_chance
