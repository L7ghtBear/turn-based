extends MoveCondition
class_name EntityChangeCondition
## MoveCondition for allies/enemies killed or remaining

@export_enum("Allies", "Enemies") var team := "Allies"
@export_enum("Greater", "Less", "Equal", "Greater Equal", "Less Equal") var operator := "Greater"
@export var value: int
@export_enum("Alive", "Killed") var status := "Alive"


func is_valid(entity: Entity):
	var check_num: int
	
	# get the relevant num (enemies/allies killed or alive)
	if team == "Allies" and status == "Alive":
		check_num = CombatBlackboard.get_num_remaining_survivors()
	elif team == "Allies" and status == "Killed":
		check_num = CombatBlackboard.get_num_defeated_survivors()
	elif team == "Enemies" and status == "Alive":
		check_num = CombatBlackboard.get_num_remaining_enemies()
	elif team == "Enemies" and status == "Killed":
		check_num = CombatBlackboard.get_num_defeated_enemies()

	# check if the relevant num meets the operator criteria
	match operator:
		"Greater":
			return check_num > value
		"Less":
			return check_num < value
		"Equal":
			return check_num == value
		"Greater Equal":
			return check_num >= value
		"Less Equal":
			return check_num <= value
