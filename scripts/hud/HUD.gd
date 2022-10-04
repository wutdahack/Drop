extends CanvasLayer

onready var titlePopupScene: PackedScene = preload("res://scenes/hud/TitlePopup.tscn")
onready var titlePopup: Control = titlePopupScene.instance()
var pauseScreenScene: PackedScene
var pauseScreen: Node

func _ready() -> void:
	add_child(titlePopup)
	move_child(titlePopup, get_child_count())

func _on_PauseButton_pressed():
	pauseScreenScene = load("res://scenes/hud/PauseScreen.tscn") # load scene in signal so that the scene won't be null after it's deleted
	pauseScreen = pauseScreenScene.instance()
	add_child(pauseScreen)
	get_tree().set_pause(true)
