extends Control

func _on_ResetButton_pressed():
	GlobalVariables.resetScore()
	get_tree().set_pause(false)
	queue_free()

func _on_PlayButton_pressed():
	get_tree().set_pause(false)
	queue_free()
