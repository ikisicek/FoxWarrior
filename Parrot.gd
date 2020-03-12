extends KinematicBody2D

func _ready():
	$AnimatedSprite.play("fly")
	$AnimationPlayer.play("flying")
	
func dead():
	$CollisionShape2D.queue_free()
	$AnimatedSprite.play("dead")
	get_parent().get_parent().get_node("ScreenShake").screen_shake(1,1,5)
	if global.zvukovi == true:
		$AudioBatBird.play()
	


