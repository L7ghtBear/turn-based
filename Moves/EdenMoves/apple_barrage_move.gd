extends Move
class_name AppleBarrageMove


func execute(entity: Entity):
	print("Executed Apple Barrage on ", CombatBlackboard.get_enemy_target())
