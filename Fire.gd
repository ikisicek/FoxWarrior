extends Node2D

func _ready():
	$Area2D/Sprite/AnimationPlayer.play("fire")




func _on_Area2D_body_entered(body):
	if "Player" in body.name:
		get_parent().get_parent().get_node("Player").dead()
