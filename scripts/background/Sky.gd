extends Node2D

onready var screen: Rect2 = get_tree().get_root().get_visible_rect()
onready var colour: Color

func _ready() -> void:
	colour = Color(0.41, 0.68, 0.89, 1) # a light blue

func _draw() -> void:
	draw_rect(Rect2(screen.position, screen.size), colour)
