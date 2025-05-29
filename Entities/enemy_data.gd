extends Resource
class_name EnemyData
## Persistent data about an enemy used to instatiate scenes in battle and access information outside


# core values
@export var id: EnemyDatabase.EnemyID # entity id, which can be referenced in an id storing singleton
@export var name: String
@export var battle_scene: PackedScene

# health
@export var current_health: int
@export var max_health: int

# frontline
@export var is_frontline: bool

# class managed
@export var attributes: Array[Attribute]

# implement later
@export var level: int


## When created, set attributes to the default ones for the given survivor
func init(template: EnemyTemplate 	):
	id = template.id
	battle_scene = template.battle_scene
	max_health = template.max_health
	current_health = template.max_health
	attributes = template.attributes.duplicate()

# setters


# getters


func get_health() -> int:
	return current_health


func get_max_health() -> int:
	return max_health
