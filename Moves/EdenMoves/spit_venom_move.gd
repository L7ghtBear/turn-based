extends Move
class_name SpitVenomMove


func execute(entity: Entity):
	print("Executed Spit Venom on ", CombatBlackboard.get_enemy_target())
