extends Move
class_name LivingTreeMove


func execute(entity: Entity):
	print("Executed Living Tree on ", CombatBlackboard.get_enemy_target())
