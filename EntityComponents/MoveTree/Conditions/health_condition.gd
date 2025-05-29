extends MoveCondition
class_name HealthCondition


@export_enum("Greater", "Less", "Equal", "Greater Equal", "Less Equal") var operator = "Greater"
@export var health_value: int
@export_enum("Exact", "Percentage") var health_type = "Exact"


func is_valid(entity: Entity):
	var health: int
	if health_type == "Exact":
		health = entity.get_health()
	if health_type == "Percentage":
		health = entity.get_health(true)
	match operator:
		"Greater":
			return health > health_value
		"Less":
			return health < health_value
		"Equal":
			return health == health_value
		"Greater Equal":
			return health >= health_value
		"Less Equal":
			return health <= health_value
