extends CollectsWater

func _on_Bucket_Collect(_area: Area2D):
	$AnimationPlayer.play("Shake")

func _on_AnimationPlayer_animation_finished(anim_name: String):
	if (anim_name == "Shake"):
		$AnimationPlayer.play("Idle")
