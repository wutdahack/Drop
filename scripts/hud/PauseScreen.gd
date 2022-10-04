extends Control

var confirmationScreenScene: PackedScene
var confirmationScreen: Control

func _on_ResetButton_pressed():
	confirmationScreenScene = load("res://scenes/hud/ConfirmationScreen.tscn")
	confirmationScreen = confirmationScreenScene.instance()
	get_parent().add_child(confirmationScreen)
	queue_free()

func _on_PlayButton_pressed():
	get_tree().set_pause(false)
	queue_free()
