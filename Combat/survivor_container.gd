extends Node2D
class_name SurvivorContainer

## Emit when survivor setup has been finalized (position etc)
signal survivor_setup_finished(survivor_scene_array)


var survivor_scenes: Array[Survivor]


## Called when the survivor container has had all its survivor children added
func finish_survivor_setup():
	for child in get_children():
		if child is Survivor:
			survivor_scenes.append(child)
	
	survivor_setup_finished.emit(survivor_scenes)
	
