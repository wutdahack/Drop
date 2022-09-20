extends Area2D

class_name RainDrop

onready var starting_pos: Vector2 = position
var hasCollided: bool = false
var speed: int = 250

func _physics_process(delta: float):
	position.y += speed * delta

func _on_RainDrop_collected(body: Node):
	if (body is CollisionObject2D && body.get_collision_layer() == 1 && !hasCollided): # if on an item that can collect water's layer
		$DropSound.play()
		hasCollided = true
		GlobalVariables.collectedDrops += 1
		GlobalVariables.updateScore()
	elif (body is CollisionObject2D && body.get_collision_layer() == 4 && !hasCollided): # if on the ground layer
		$DropSound.play()
		hasCollided = true
	hide()


func _on_DropSound_finished():
	queue_free()
