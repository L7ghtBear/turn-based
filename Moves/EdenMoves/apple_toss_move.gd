extends Move
class_name AppleTossMove


func execute(entity: Entity):
	var target = CombatBlackboard.get_enemy_target()
	
	var attack = Attack.new()
	attack.applied_statuses.append(CurseStatus.new())
	attack.uses_true_damage = true
	attack.damage = 5
	attack.attacker = entity
	
	# TODO setup system for requesting attacks (again, invis etc)
	target.handle_attack(attack)
	
	print("Executed Apple Toss on ", target)
