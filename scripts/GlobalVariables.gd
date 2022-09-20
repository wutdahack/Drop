extends Node

var collectedDrops: int = COLLECTED_DROPS_RESET
const COLLECTED_DROPS_RESET: int = 0
onready var game: Node2D = get_node_or_null("/root/Game") #get node or null over get node as no error occurs when loading a scene other game
onready var scoreLabel: Label

func updateScore():
	scoreLabel.set_text(str(collectedDrops))

func resetScore():
	collectedDrops = COLLECTED_DROPS_RESET
	updateScore()
