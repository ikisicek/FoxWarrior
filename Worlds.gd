extends Control

var change_screen_timer = 0

func _on_BackButton_pressed():
	SceneChanger.change_scene("res://Scenes/Map.tscn")

func _ready():
	##ispis zvjezdica:
	if global_baloons.level1 == 0:
		$baloons_stars/Baloons_rating_1.play("0")
	if global_baloons.level1 == 1:
		$baloons_stars/Baloons_rating_1.play("1")
	if global_baloons.level1 == 2:
		$baloons_stars/Baloons_rating_1.play("2")
	if global_baloons.level1 == 3:
		$baloons_stars/Baloons_rating_1.play("3")
		
	if global_baloons.level2 == 0:
		$baloons_stars/Baloons_rating_2.play("0")
	if global_baloons.level2 == 1:
		$baloons_stars/Baloons_rating_2.play("1")
	if global_baloons.level2 == 2:
		$baloons_stars/Baloons_rating_2.play("2")
	if global_baloons.level2 == 3:
		$baloons_stars/Baloons_rating_2.play("3")
	
	if global_baloons.level3 == 0:
		$baloons_stars/Baloons_rating_3.play("0")
	if global_baloons.level3 == 1:
		$baloons_stars/Baloons_rating_3.play("1")
	if global_baloons.level3 == 2:
		$baloons_stars/Baloons_rating_3.play("2")
	if global_baloons.level3 == 3:
		$baloons_stars/Baloons_rating_3.play("3")
		
	if global_baloons.level4 == 0:
		$baloons_stars/Baloons_rating_4.play("0")
	if global_baloons.level4 == 1:
		$baloons_stars/Baloons_rating_4.play("1")
	if global_baloons.level4 == 2:
		$baloons_stars/Baloons_rating_4.play("2")
	if global_baloons.level4 == 3:
		$baloons_stars/Baloons_rating_4.play("3")
	
	if global_baloons.level5 == 0:
		$baloons_stars/Baloons_rating_5.play("0")
	if global_baloons.level5 == 1:
		$baloons_stars/Baloons_rating_5.play("1")
	if global_baloons.level5 == 2:
		$baloons_stars/Baloons_rating_5.play("2")
	if global_baloons.level5 == 3:
		$baloons_stars/Baloons_rating_5.play("3")
	
	if global_baloons.level6 == 0:
		$baloons_stars/Baloons_rating_6.play("0")
	if global_baloons.level6 == 1:
		$baloons_stars/Baloons_rating_6.play("1")
	if global_baloons.level6 == 2:
		$baloons_stars/Baloons_rating_6.play("2")
	if global_baloons.level6 == 3:
		$baloons_stars/Baloons_rating_6.play("3")
	
	
#	if global.level >= 1:
#		$level1.disabled = false
#	if global.level >= 2:
#		$level2.disabled = false
#	if global.level >= 3:
#		$level3.disabled = false
#	if global.level >= 4:
#		$level4.disabled = false
#	if global.level >= 5:
#		$level5.disabled = false
#	if global.level >= 6:
#		$level6.disabled = false
	pass

func _on_level1_pressed():
	SceneChanger.change_scene("res://Scenes/Levels/Stage01.tscn")
	
func _on_level2_pressed():
	SceneChanger.change_scene("res://Scenes/Levels/Stage02.tscn")

func _on_level3_pressed():
	SceneChanger.change_scene("res://Scenes/Levels/Stage03.tscn")
	
func _on_level4_pressed():
	SceneChanger.change_scene("res://Scenes/Levels/Stage04.tscn")

func _on_level5_pressed():
	SceneChanger.change_scene("res://Scenes/Levels/Stage05.tscn")

func _on_level6_pressed():
	SceneChanger.change_scene("res://Scenes/Levels/Stage06.tscn")
	