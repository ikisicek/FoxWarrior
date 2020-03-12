extends Area2D

func _ready():
	$AnimatedSprite.play("idle")
	
func _on_Crown_body_entered(body):
	if "Player" in body.name:
		body.crown_power_up()
		$CollisionShape2D.queue_free()
		$AnimationPlayer.play("anim")
		$Label.visible = true
		$Label/AnimationLabel.play("powerup")
		if global.zvukovi == true:
			$AudioPowerUp.play()
