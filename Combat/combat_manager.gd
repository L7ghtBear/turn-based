extends Node2D
class_name CombatManager
## Handles combat information like turns, allies, and enemies, and updates the blackboard

@export var temp_allies: Array[SurvivorData]
@export var temp_enemies: Array[EnemyData]

# dependencies
@onready var turn_manager = $TurnManager
@onready var survivor_container = $SurvivorContainer
@onready var enemy_container = $EnemyContainer
@onready var entity_factory = $EntityFactory

var survivor_scenes: Array[Survivor]
var enemy_scenes : Array[Enemy]

func _ready() -> void:
	#TODO this may have to be moved from the _ready function since the blackboard may not have
	#TODO the list of survivors on _ready()
	CombatBlackboard.reset()
	_connect_signals()
	spawn_survivors(temp_allies, survivor_container)
	spawn_enemies(temp_enemies, enemy_container)


func _connect_signals() -> void:
	survivor_container.connect("survivor_setup_finished", _on_survivor_setup_finished)
	enemy_container.connect("enemy_setup_finished", _on_enemy_setup_finished)



## Pass Array of SurvivorData being used in battle to EntityFactory with spawn location SurvivorContainer
func spawn_survivors(survivor_data_array: Array[SurvivorData], container_for_survivors: SurvivorContainer):
	entity_factory.spawn_survivors(survivor_data_array, container_for_survivors)


## Pass Array of Enemy ___ being used in battle to EntityFactory with spawn location EnemyContainer
func spawn_enemies(enemy_data_array: Array, container_for_enemies: EnemyContainer):
	entity_factory.spawn_enemies(enemy_data_array, container_for_enemies)


## Signalled from SurvivorContainer when survivor scenes are all created and passes array
func _on_survivor_setup_finished(survivor_scene_array: Array[Survivor]):
	survivor_scenes = survivor_scene_array
	turn_manager.set_survivors(survivor_scene_array)
	CombatBlackboard.set_survivors(survivor_scenes)


## Signalled from EnemyContainer when enemy scenes are all created and passes array
func _on_enemy_setup_finished(enemy_scene_array: Array[Enemy]):
	enemy_scenes = enemy_scene_array
	turn_manager.set_enemies(enemy_scene_array)
	CombatBlackboard.set_enemies(enemy_scenes)
