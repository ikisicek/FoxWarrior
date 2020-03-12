extends Node2D

var current_shake_priority = 0

func _ready():
	pass # Replace with function body.

func move_camera(vector):
	get_parent().get_node("Player").get_node("Camera2D").offset = Vector2(rand_range(-vector.x, vector.x), rand_range(-vector.y, vector.y))
	#rand_range - uzima 2 argumenta i odabere radnom broj izmedu ta dva
	#vector x - x komponenta od vektora kamere
	#offset - koliko cemo pomaknuti ekran (1,1) - 1 pixel desno, 1 dole
	
func screen_shake(shake_length, shake_power, shake_priority):
	if shake_priority > current_shake_priority:
		current_shake_priority = shake_priority
		#tween node - uzima broj izmedu ponudenih
		$Tween.interpolate_method(self, "move_camera", Vector2(shake_power, shake_power), Vector2(0, 0), shake_length, Tween.TRANS_SINE, Tween.EASE_OUT, 0)
		$Tween.start()
		

#signal od Tweena-a
#kad je tween (shakeanje) gotov zelimo vratiti priority na nulu
func _on_Tween_tween_completed(object, key):
	current_shake_priority = 0
