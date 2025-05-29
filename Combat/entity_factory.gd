extends Node2D
class_name EntityFactory


## Instance survivors from SurvivorData, setup values, and spawn in SurvivorContainer
func spawn_survivors(survivor_data_array: Array[SurvivorData], survivor_container: SurvivorContainer):
	for survivor_data in survivor_data_array:
		var survivor_scene = survivor_data.battle_scene.instantiate()
		survivor_container.add_child(survivor_scene)
		_setup_survivor_stats(survivor_scene, survivor_data)
	
	survivor_container.finish_survivor_setup()


func _setup_survivor_stats(survivor_scene: Survivor, survivor_data: SurvivorData):
	survivor_scene.set_health(survivor_data.get_health())
	survivor_scene.set_max_health(survivor_data.get_max_health())
	survivor_scene.is_frontline = survivor_data.is_frontline
	# TEST
	survivor_scene.global_position = Vector2(100,200)


## Instance enemies from EnemyData, setup values, and spawn in EnemyContainer
func spawn_enemies(enemy_data_array: Array[EnemyData], enemy_container: EnemyContainer):
	for enemy_data in enemy_data_array:
		var enemy_scene = enemy_data.battle_scene.instantiate()
		enemy_container.add_child(enemy_scene)
		_setup_enemy_stats(enemy_scene, enemy_data)
	
	enemy_container.finish_enemy_setup()


func _setup_enemy_stats(enemy_scene: Enemy, enemy_data: EnemyData):
	enemy_scene.set_health(enemy_data.get_health())
	enemy_scene.set_max_health(enemy_data.get_max_health())
	enemy_scene.is_frontline = enemy_data.is_frontline
	# TEST
	enemy_scene.global_position = Vector2(700,200)
