extends Control

func _on_ResetButton_pressed():
	GlobalVariables.resetScore() # reset collectedDrops
	get_tree().set_pause(false) # unpause game
	queue_free() # delete pause screen

func _on_PlayButton_pressed():
	get_tree().set_pause(false) # unpause game
	queue_free() # delete pause screen
