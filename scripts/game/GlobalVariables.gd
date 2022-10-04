extends Node

onready var scoreLabel: Label
onready var collectedDrops: int = COLLECTED_DROPS_RESET
const COLLECTED_DROPS_RESET: int = 0

func updateScore() -> void:
	scoreLabel.set_text(str(collectedDrops))

func resetScore() -> void:
	collectedDrops = COLLECTED_DROPS_RESET
	updateScore()

func incrementScore() -> void:
	collectedDrops += 1
