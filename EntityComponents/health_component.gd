extends Node
class_name HealthComponent


signal health_update


@export var max_health: int
@export var health: int


# Decrease health by amount
func take_damage(amount: int):
	health = max(health - amount, 0)
	health_update.emit()


func take_true_damage(amount: int):
	var flat_damage = int(float(amount)/100.0 * float(max_health))
	take_damage(flat_damage)

# setters

## set the entity's health to a specific amount
func set_health(amount: int) -> void:
	health = amount
	health_update.emit()

## set the entity's max health to a specific amount
func set_max_health(amount: int) -> void:
	max_health = amount
	health_update.emit()


# getters


## returns the current amount of health as its true value
func get_health() -> int:
	return health


## Returns the current amount of health as a percentage rounded down (out of 100)
func get_health_percentage() -> int:
	return int(float(health)/float(max_health) * 100)


## returns the current max_health
func get_max_health() -> int:
	return max_health


func _on_take_10_damage_button_down() -> void:
	take_damage(10)
