extends Area2D

func _ready():
	pass
	
func _on_PinkDiamond_body_entered(body):
	if "Player" in body.name:
		#$LabelTimer.start()
		#$DiamondLabel.visible = true
		$DiamondLabel/AnimationDiamondLabel.play("diamond") 
		$CollisionShape2D.queue_free()
		#$AnimatedSprite.visible = false
		if global.zvukovi == true:
			$AudioDiamond.play()
		get_parent().starttime += 6
		$AnimationPlayer.play("clock")
		

		
