extends KinematicBody2D

class_name CollectsWater

onready var screen: Rect2 = get_tree().get_root().get_visible_rect()
var velocity: Vector2 = Vector2.ZERO
var speed: int = 400
var gravity: int = 35

func _physics_process(_delta: float) -> void:
	
	if Input.is_action_pressed("move_left"):
		velocity.x = -speed
	elif Input.is_action_pressed("move_right"):
		velocity.x = speed
	else:
		velocity.x = 0
	
	velocity.y += gravity
	
	velocity = move_and_slide(velocity, Vector2.UP)
	updatePosition()

func updatePosition() -> void:
	position.x = clamp(position.x, screen.position.x, screen.size.x) # make sure the item that can collect water doesn't go offscreen
