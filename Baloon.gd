extends KinematicBody2D

signal star_collected

func _ready():
	$AnimatedSprite.play("idle")
	
func dead():
	emit_signal("star_collected")
	$CollisionShape2D.queue_free()
	$AnimatedSprite.play("shoot")
	if global.zvukovi == true:
		$AudioStreamPlayer2D.play()
	global.baloon += 1
	
