extends Node2D
class_name EnemyContainer

## Emit when enemy setup has been finalized (position etc)
signal enemy_setup_finished(enemy_scene_array)


var enemy_scenes: Array[Enemy]


## Called when the EnemyContainer has had all its enemy children added
func finish_enemy_setup():
	for child in get_children():
		if child is Enemy:
			enemy_scenes.append(child)
	
	enemy_setup_finished.emit(enemy_scenes)
	
