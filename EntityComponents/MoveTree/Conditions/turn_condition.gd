extends MoveCondition
class_name TurnCondition

## The type determines whether you care about the exact turn, or the turn category (e.g. even/odd)
@export_enum("Exact", "Category") var type_to_use: String = "Exact"

@export_group("UseExactTurn", "exact")
@export_enum("Greater", "Less", "Equal", "Greater Equal", "Less Equal") var exact_operator := "Greater"
@export var exact_turn: int = 1

@export_group("UseTurnCategory", "category")
@export_enum("Odd", "Even") var category_operator := "Odd"


func is_valid(entity: Entity):
	var current_turn = CombatBlackboard.get_current_round()
	# if using exact turn, calculate using the operator
	if type_to_use == "Exact":
		match exact_operator:
			"Greater":
				return current_turn > exact_turn
			"Less":
				return current_turn < exact_turn
			"Equal":
				return current_turn == exact_turn
			"Greater Equal":
				return current_turn >= exact_turn
			"Less Equal":
				return current_turn <= exact_turn
	
	# if using the category, calculate
	elif type_to_use == "Category":
		if category_operator == "Odd":
			return current_turn % 2 == 1
		if category_operator == "Even":
			return current_turn % 2 == 0
