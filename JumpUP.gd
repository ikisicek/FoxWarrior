extends Area2D


func _ready():
	$AnimatedSprite.play("idle")

func _on_JumpUP_body_entered(body):
	if "Player" in body.name:
		body.more_jump()
		$CollisionShape2D.queue_free()
		$AnimationPlayer.play("anim")
		$Label.visible = true
		$Label/AnimationLabel.play("powerup")
		if global.zvukovi == true:
			$AudioPowerUp.play()
