extends CanvasLayer

onready var titlePopupScene: PackedScene = preload("res://scenes/TitlePopup.tscn")
onready var titlePopup: Control = titlePopupScene.instance()
onready var pauseScreenScene: PackedScene
onready var pauseScreen: Node

func _ready():
	add_child(titlePopup)
	move_child(titlePopup, get_child_count())

func _on_PauseButton_pressed():
	pauseScreenScene = load("res://scenes/PauseScreen.tscn") # load scene in signal so that the scene won't be null after it's deleted
	pauseScreen = pauseScreenScene.instance()
	add_child(pauseScreen) # pause screen will show up
	get_tree().set_pause(true) # pause game
