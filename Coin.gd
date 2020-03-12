extends Area2D

func _ready():
	$AnimatedSprite.play("idle")
	
func _on_Coin_body_entered(body):
	if "Player" in body.name:
		if global.zvukovi == true:
			$AudioStreamPlayer2D.play()
		$AnimatedSprite.play("collect")
		$CollisionShape2D.queue_free()
		global.coins += 1
