extends Node
## CombatBlackboard
## Functions as blackboard that provides all entities with info on current combat state
## Sends signals to trigger timed events

# signals with roughly pre-determined times in combat
signal combat_start()
signal combat_end()
signal round_start()
signal round_end()
signal survivor_team_start()
signal survivor_team_end()
signal player_turn_start()
signal player_turn_end()
signal enemy_team_start()
signal enemy_team_end
signal turn_start()
signal turn_end()


var _survivors: Array[Survivor] = [] 	# the survivors in battle
var _initial_survivor_count = 0			# num survivors before deaths
var _enemies: Array[Enemy] = []			# the enemies in battle
var _initial_enemy_count = 0			# num enemies before deaths
var _current_round: int = 1				# the round number


## Sets all variables back to their initial value
func reset():
	_survivors = []
	_enemies = []
	_current_round = 1


# setters


## Sets the array of survivor scenes currently in battle.
## Will also update _initial_survivor_count.
func set_survivors(survivor_array: Array[Survivor]):
	_survivors = survivor_array
	_initial_survivor_count = _survivors.size()


## Sets the array of enemy scenes currently in battle.
## Will also update _initial_enemy_count.
func set_enemies(enemy_array: Array[Enemy]):
	_enemies = enemy_array
	_initial_enemy_count = _enemies.size()


## Sets the current round of battle
func set_current_round(round_number: int):
	_current_round = round_number


# getters


## Returns the number of enemies that have been defeated this combat
func get_num_defeated_enemies() -> int:
	return _initial_enemy_count - _enemies.size()


## Returns the number of allies that have been defeated this combat
func get_num_defeated_survivors() -> int:
	return _initial_survivor_count - _survivors.size()


## Returns the number of enemies remaining this combat
func get_num_remaining_enemies() -> int:
	return _enemies.size()


## Returns the number of survivors remaining this combat (self included)
func get_num_remaining_survivors() -> int:
	return _survivors.size()


## Returns the battle's current round
func get_current_round() -> int:
	return _current_round


## Return a valid target from the currently alive enemies.
## Prioritizes enemies in the frontline if they exist (unless ignore_frontline is true)
## TODO this func should "ask" the target if they can be targetted (e.g. Invisibility)
func get_enemy_target(ignore_frontline = false) -> Enemy:
	var targets: Array[Enemy]
	
	# ignore frontline, get target from all
	if ignore_frontline:
		targets = _enemies.duplicate()
	
	# don't ignore frontline, get target that is_frontline
	else: 
		targets = _enemies.filter(func check_frontline(enemy: Enemy): return enemy.is_frontline)
		
		# if no frontline, get targets from all enemies
		targets = _enemies.duplicate()
	
	# no enemies at all but we targetting? return null and push error
	if targets.size() == 0:
		push_error("Attempting to target but no enemies exist")
		return null
	
	# now targets is set up correctly, get random and return
	return targets.get(randi_range(0, targets.size() -1))


## Return a valid target from the currently alive survivors.
## Prioritizes survivors in the frontline if they exist (unless ignore_frontline is true)
## TODO this func should "ask" the target if they can be targetted (e.g. Invisibility)
func get_survivor_target(ignore_frontline = false) -> Survivor:
	var targets: Array[Survivor]
	
	# ignore frontline, get target from all
	if ignore_frontline:
		targets = _survivors.duplicate()
	
	# don't ignore frontline, get target that is_frontline
	else: 
		targets = _survivors.filter(func check_frontline(survivor: Survivor): return survivor.is_frontline)
		
		# if no frontline, get targets from all enemies
		targets = _survivors.duplicate()
	
	# no enemies at all but we targetting? return null and push error
	if targets.size() == 0:
		push_error("Attempting to target but no survivors exist")
		return null
	
	# now targets is set up correctly, get random and return
	return targets.get(randi_range(0, targets.size() -1))
