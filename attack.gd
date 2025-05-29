extends Resource
class_name Attack

var damage: int = -1
var uses_true_damage: bool = false
var applied_statuses: Array[Status] = []
var attacker: Entity = null
