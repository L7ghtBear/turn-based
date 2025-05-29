extends Node2D
class_name Entity
## Class for entities as used in battle


signal turn_finished


# Dependencies
@onready var move_selector: MoveSelector = $MoveSelector
@onready var move_container: MoveContainer = $MoveContainer
@onready var status_container: StatusContainer = $StatusContainer
@onready var health_component: HealthComponent = $HealthComponent
@onready var attack_handler: AttackHandler = $AttackHandler

var is_frontline: bool

func _ready() -> void:
	_setup_signals()
	#TODO TEMP CODE FOR TESTING HEALTH DISPLAY
	health_component.connect("health_update", TEMP_LABEL)

func TEMP_LABEL():
	$Label.text = str(health_component.get_health()) + "/" + str(health_component.get_max_health())

func _setup_signals() -> void:
	# connect move_finished in moves
	for move in move_container.get_children():
		if not move is Move:
			push_error(move_container, " contains children that are not Moves")
		
		move.connect("move_finished", _on_move_finished)


## logic for taking turns, called by TurnManager
func take_turn():
	move_selector.execute_move(self)


func handle_attack(attack: Attack):
	attack_handler.handle_attack(attack)
	print("attack sent to handler")


# setters


func set_health(amount: int):
	health_component.set_health(amount)

func set_max_health(amount: int):
	health_component.set_max_health(amount)

# getters


func get_status_instance(id: StatusDatabase.StatusID) -> Status:
	return status_container.get_status(id)


func get_health(as_percentage := false):
	if as_percentage:
		return health_component.get_health_percentage()
	else:
		return health_component.get_health()


func _on_move_finished():
	turn_finished.emit()
