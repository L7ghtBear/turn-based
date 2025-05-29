extends Node
## PartyManager

## Autoload used to store and access the current members of the survivor party
## Stores data as an array of PlayerData resources
## Add meta information about players (e.g. order they were added etc.) as needed

var party: Array[SurvivorData] = []

## Add a survivor to the party
func add_survivor(data: SurvivorData) -> void:
	party.append(data)

## Remove a survivor from the party
## (e.g. on death)
func remove_survivor(id: SurvivorDatabase.SurvivorID) -> void:
	party.erase(get_survivor_by_id(id))

## Get a reference to a survivor in the party by its id
## 
func get_survivor_by_id(id: SurvivorDatabase.SurvivorID) -> SurvivorData:
	for survivor in party:
		if survivor.id == id:
			return survivor
	return null
