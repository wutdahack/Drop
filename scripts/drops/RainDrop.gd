extends Area2D

var hasCollided: bool = false
var speed: int = 250
var wasCollected: bool = false
const SPEED_RESET: int = 0

func _physics_process(delta: float) -> void:
	position.y += speed * delta

func _on_RainDrop_collected(body: Node):
	if (body is CollisionObject2D && body.get_collision_layer() == 1 && !hasCollided): # if on an item that can collect water's layer
		$DropSound.play()
		hasCollided = true
		wasCollected = true
		GlobalVariables.incrementScore()
		GlobalVariables.updateScore()
		hide()
	elif (body is CollisionObject2D && body.get_collision_layer() == 4 && !hasCollided): # if on the ground layer
		$DropSound.play()
		$AnimatedSprite.play("soak")
		hasCollided = true
		speed = SPEED_RESET
	set_deferred("monitorable", false) # set_deferred over set_monitorable since set_monitorable is blocked during signal

func _on_AnimatedSprite_animation_finished():
	queue_free()

func _on_DropSound_finished():
	if (wasCollected):
		queue_free()
