extends Control

func _ready() -> void:
	get_tree().set_pause(true)

func _on_PlayButton_pressed():
	get_tree().set_pause(false)
	queue_free()
