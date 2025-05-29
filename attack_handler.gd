extends Node
class_name AttackHandler

@export var health_component: HealthComponent
@export var status_container: StatusContainer


func handle_attack(attack: Attack):
	# check for true vs base damage
	if attack.uses_true_damage:
		health_component.take_true_damage(attack.damage)
	else:
		health_component.take_damage(attack.damage)
	
	# apply statuses
	for status in attack.applied_statuses:
		status_container.add_status(status)
