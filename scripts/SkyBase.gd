extends Node2D

class_name SkyBase

onready var screen: Rect2 = get_tree().get_root().get_visible_rect()
var colour: Color

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.!= null


func _draw():
	draw_rect(Rect2(screen.position, screen.size), colour)
