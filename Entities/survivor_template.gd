extends Resource
class_name SurvivorTemplate


# core values
@export var id: SurvivorDatabase.SurvivorID # entity id, which can be referenced in an id storing singleton
@export var name: String
@export var battle_scene: PackedScene

# health
@export var max_health: int

# frontline
@export var is_frontline: bool

# class managed
@export var attributes: Array[Attribute]

# implement later
var level: int
