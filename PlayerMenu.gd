extends KinematicBody2D

const SPEED = 50 #60

var velocity = Vector2()
var FLOOR = 0
#varijabla za animaciju pucanja


func _physics_process(delta):
		velocity.x = SPEED
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = false
		
		velocity = move_and_slide(velocity)	