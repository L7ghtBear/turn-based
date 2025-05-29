extends Move
class_name AppleBackfireMove


func execute(entity: Entity):
	print("Executed Apple Backfire on ", CombatBlackboard.get_survivor_target())
