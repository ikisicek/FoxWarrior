extends Area2D


func _ready():
	$AnimatedSprite.play("default")
	
func _on_PinkDiamond_body_entered(body):
	if "Player" in body.name:
		#$LabelTimer.start()
		#$DiamondLabel.visible = true
		$DiamondLabel/AnimationDiamondLabel.play("diamond") 
		$CollisionShape2D.queue_free()
		$AnimatedSprite.visible = false
		if global.zvukovi == true:
			$AudioDiamond.play()
		get_parent().get_node("Spike").queue_free()


