extends KinematicBody2D

var is_dead = false

func _ready():
	$AnimatedSprite.play("idle")
	
func dead():
	is_dead = true
	$CollisionShape2D.queue_free()
	$AnimatedSprite.play("dead")
	get_parent().get_parent().get_node("ScreenShake").screen_shake(1,1,1)
	$AudioPlant.play()

func _on_Area2D_body_entered(body):
	if "Player" in body.name and is_dead == false:
		$AnimatedSprite.play("attack")
