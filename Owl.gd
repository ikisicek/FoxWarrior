extends Node2D

func _on_Area2DOwl_body_entered(body):
	if "Player" in body.name:
		#$AnimationPlayer.play("idle")
		$Sprite.play("default")
		$StripTalk.visible = true
		$OwlLabel.visible = true
		if global.zvukovi == true:
			$AudioOwl.play()
	
func _on_Area2DOwl_body_exited(body):
	if "Player" in body.name:
		#$AnimationPlayer.play("defaul")
		$Sprite.stop()
		$StripTalk.visible = false
		$OwlLabel.visible = false
		$AudioOwl.stop()
		
