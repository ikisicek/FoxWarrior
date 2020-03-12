extends Control

var change_screen_timer = 0

func _on_BackButton_pressed():
	SceneChanger.change_scene("res://Scenes/Map.tscn")

func _ready():
	##ispis zvjezdica:
	if global_baloons.level13 == 0:
		$baloons_stars/Baloons_rating_1.play("0")
	if global_baloons.level13 == 1:
		$baloons_stars/Baloons_rating_1.play("1")
	if global_baloons.level13 == 2:
		$baloons_stars/Baloons_rating_1.play("2")
	if global_baloons.level13 == 3:
		$baloons_stars/Baloons_rating_1.play("3")
		
	if global_baloons.level14 == 0:
		$baloons_stars/Baloons_rating_2.play("0")
	if global_baloons.level14 == 1:
		$baloons_stars/Baloons_rating_2.play("1")
	if global_baloons.level14 == 2:
		$baloons_stars/Baloons_rating_2.play("2")
	if global_baloons.level14 == 3:
		$baloons_stars/Baloons_rating_2.play("3")
	
	if global_baloons.level15 == 0:
		$baloons_stars/Baloons_rating_3.play("0")
	if global_baloons.level15 == 1:
		$baloons_stars/Baloons_rating_3.play("1")
	if global_baloons.level15 == 2:
		$baloons_stars/Baloons_rating_3.play("2")
	if global_baloons.level15 == 3:
		$baloons_stars/Baloons_rating_3.play("3")
		
	if global_baloons.level16 == 0:
		$baloons_stars/Baloons_rating_4.play("0")
	if global_baloons.level16 == 1:
		$baloons_stars/Baloons_rating_4.play("1")
	if global_baloons.level16 == 2:
		$baloons_stars/Baloons_rating_4.play("2")
	if global_baloons.level16 == 3:
		$baloons_stars/Baloons_rating_4.play("3")
	
	if global_baloons.level17 == 0:
		$baloons_stars/Baloons_rating_5.play("0")
	if global_baloons.level17 == 1:
		$baloons_stars/Baloons_rating_5.play("1")
	if global_baloons.level17 == 2:
		$baloons_stars/Baloons_rating_5.play("2")
	if global_baloons.level17 == 3:
		$baloons_stars/Baloons_rating_5.play("3")
	
	if global_baloons.level18 == 0:
		$baloons_stars/Baloons_rating_6.play("0")
	if global_baloons.level18 == 1:
		$baloons_stars/Baloons_rating_6.play("1")
	if global_baloons.level18 == 2:
		$baloons_stars/Baloons_rating_6.play("2")
	if global_baloons.level18 == 3:
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


func _on_level13_pressed():
	SceneChanger.change_scene("res://Scenes/Levels/Stage13.tscn")
	


func _on_level14_pressed():
	SceneChanger.change_scene("res://Scenes/Levels/Stage14.tscn")


func _on_level15_pressed():
	SceneChanger.change_scene("res://Scenes/Levels/Stage15.tscn")


func _on_level16_pressed():
	SceneChanger.change_scene("res://Scenes/Levels/Stage16.tscn")


func _on_level17_pressed():
	SceneChanger.change_scene("res://Scenes/Levels/Stage17.tscn")


func _on_level18_pressed():
	SceneChanger.change_scene("res://Scenes/Levels/Stage18.tscn")
