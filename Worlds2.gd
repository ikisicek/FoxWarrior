extends Control

var change_screen_timer = 0

func _on_BackButton_pressed():
	SceneChanger.change_scene("res://Scenes/Map.tscn")

func _ready():
	##ispis zvjezdica:
	if global_baloons.level7 == 0:
		$baloons_stars/Baloons_rating_1.play("0")
	if global_baloons.level7 == 1:
		$baloons_stars/Baloons_rating_1.play("1")
	if global_baloons.level7 == 2:
		$baloons_stars/Baloons_rating_1.play("2")
	if global_baloons.level7 == 3:
		$baloons_stars/Baloons_rating_1.play("3")
		
	if global_baloons.level8 == 0:
		$baloons_stars/Baloons_rating_2.play("0")
	if global_baloons.level8 == 1:
		$baloons_stars/Baloons_rating_2.play("1")
	if global_baloons.level8 == 2:
		$baloons_stars/Baloons_rating_2.play("2")
	if global_baloons.level8 == 3:
		$baloons_stars/Baloons_rating_2.play("3")
	
	if global_baloons.level9 == 0:
		$baloons_stars/Baloons_rating_3.play("0")
	if global_baloons.level9 == 1:
		$baloons_stars/Baloons_rating_3.play("1")
	if global_baloons.level9 == 2:
		$baloons_stars/Baloons_rating_3.play("2")
	if global_baloons.level9 == 3:
		$baloons_stars/Baloons_rating_3.play("3")
		
	if global_baloons.level10 == 0:
		$baloons_stars/Baloons_rating_4.play("0")
	if global_baloons.level10 == 1:
		$baloons_stars/Baloons_rating_4.play("1")
	if global_baloons.level10 == 2:
		$baloons_stars/Baloons_rating_4.play("2")
	if global_baloons.level10 == 3:
		$baloons_stars/Baloons_rating_4.play("3")
	
	if global_baloons.level11 == 0:
		$baloons_stars/Baloons_rating_5.play("0")
	if global_baloons.level11 == 1:
		$baloons_stars/Baloons_rating_5.play("1")
	if global_baloons.level11 == 2:
		$baloons_stars/Baloons_rating_5.play("2")
	if global_baloons.level11 == 3:
		$baloons_stars/Baloons_rating_5.play("3")
	
	if global_baloons.level12 == 0:
		$baloons_stars/Baloons_rating_6.play("0")
	if global_baloons.level12 == 1:
		$baloons_stars/Baloons_rating_6.play("1")
	if global_baloons.level12 == 2:
		$baloons_stars/Baloons_rating_6.play("2")
	if global_baloons.level12 == 3:
		$baloons_stars/Baloons_rating_6.play("3")
	
	
#	if global.level >= 7:
#		$level7.disabled = false
#	if global.level >= 8:
#		$level8.disabled = false
#	if global.level >= 9:
#		$level9.disabled = false
#	if global.level >= 10:
#		$level10.disabled = false
#	if global.level >= 11:
#		$level11.disabled = false
#	if global.level >= 12:
#		$level12.disabled = false
	pass



func _on_level7_pressed():
	SceneChanger.change_scene("res://Scenes/Levels/Stage07.tscn")
	
func _on_level8_pressed():
	SceneChanger.change_scene("res://Scenes/Levels/Stage08.tscn")

func _on_level9_pressed():
	SceneChanger.change_scene("res://Scenes/Levels/Stage09.tscn")

func _on_level10_pressed():
	SceneChanger.change_scene("res://Scenes/Levels/Stage10.tscn")

func _on_level11_pressed():
	SceneChanger.change_scene("res://Scenes/Levels/Stage11.tscn")

func _on_level12_pressed():
	SceneChanger.change_scene("res://Scenes/Levels/Stage12.tscn")
