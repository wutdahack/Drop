extends Control

func _on_YesButton_pressed():
	GlobalVariables.resetScore()
	get_tree().set_pause(false)
	queue_free()


func _on_NoButton_pressed():
	get_tree().set_pause(false)
	queue_free()
