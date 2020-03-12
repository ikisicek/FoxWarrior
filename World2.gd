extends Control

func _on_BackButton_pressed():
	get_tree().change_scene("res://Scenes/Map.tscn")

func _ready():
	if global_baloons.level7 == 0:
		$baloons_stars/Baloons_rating_7.play("0")
	if global_baloons.level7 == 1:
		$baloons_stars/Baloons_rating_7.play("1")
	if global_baloons.level7 == 2:
		$baloons_stars/Baloons_rating_7.play("2")
	if global_baloons.level7 == 3:
		$baloons_stars/Baloons_rating_7.play("3")
		
	if global_baloons.level8 == 0:
		$baloons_stars/Baloons_rating_8.play("0")
	if global_baloons.level8 == 1:
		$baloons_stars/Baloons_rating_8.play("1")
	if global_baloons.level8 == 2:
		$baloons_stars/Baloons_rating_8.play("2")
	if global_baloons.level8 == 3:
		$baloons_stars/Baloons_rating_8.play("3")
	
	if global_baloons.level9 == 0:
		$baloons_stars/Baloons_rating_9.play("0")
	if global_baloons.level9 == 1:
		$baloons_stars/Baloons_rating_9.play("1")
	if global_baloons.level9 == 2:
		$baloons_stars/Baloons_rating_9.play("2")
	if global_baloons.level9 == 3:
		$baloons_stars/Baloons_rating_9.play("3")
		
	if global_baloons.level10 == 0:
		$baloons_stars/Baloons_rating_10.play("0")
	if global_baloons.level10 == 1:
		$baloons_stars/Baloons_rating_10.play("1")
	if global_baloons.level10 == 2:
		$baloons_stars/Baloons_rating_10.play("2")
	if global_baloons.level10 == 3:
		$baloons_stars/Baloons_rating_10.play("3")
	
	if global_baloons.level11 == 0:
		$baloons_stars/Baloons_rating_11.play("0")
	if global_baloons.level11 == 1:
		$baloons_stars/Baloons_rating_11.play("1")
	if global_baloons.level11 == 2:
		$baloons_stars/Baloons_rating_11.play("2")
	if global_baloons.level11 == 3:
		$baloons_stars/Baloons_rating_11.play("3")
	
	if global_baloons.level12 == 0:
		$baloons_stars/Baloons_rating_12.play("0")
	if global_baloons.level12 == 1:
		$baloons_stars/Baloons_rating_12.play("1")
	if global_baloons.level12 == 2:
		$baloons_stars/Baloons_rating_12.play("2")
	if global_baloons.level12 == 3:
		$baloons_stars/Baloons_rating_12.play("3")
	
	
	
	
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

func _on_level7_pressed():
	get_tree().change_scene("res://Scenes/Levels/Stage07.tscn")

func _on_level8_pressed():
	get_tree().change_scene("res://Scenes/Levels/Stage08.tscn")

func _on_level9_pressed():
	get_tree().change_scene("res://Scenes/Levels/Stage09.tscn")

func _on_level10_pressed():
	get_tree().change_scene("res://Scenes/Levels/Stage10.tscn")

func _on_level11_pressed():
	get_tree().change_scene("res://Scenes/Levels/Stage11.tscn")

func _on_level12_pressed():
	get_tree().change_scene("res://Scenes/Levels/Stage12.tscn")

func _on_level13_pressed():
	get_tree().change_scene("res://Scenes/Levels/Stage13.tscn")

func _on_level14_pressed():
	get_tree().change_scene("res://Scenes/Levels/Stage14.tscn")

func _on_level15_pressed():
	get_tree().change_scene("res://Scenes/Levels/Stage15.tscn")

func _on_level16_pressed():
	get_tree().change_scene("res://Scenes/Levels/Stage16.tscn")
	
func _on_level17_pressed():
	get_tree().change_scene("res://Scenes/Levels/Stage17.tscn")

func _on_level18_pressed():
	get_tree().change_scene("res://Scenes/Levels/Stage18.tscn")


func _on_level19_pressed():
	get_tree().change_scene("res://Scenes/Levels/Stage19.tscn")


func _on_level20_pressed():
	get_tree().change_scene("res://Scenes/Levels/Stage20.tscn")


func _on_level21_pressed():
	get_tree().change_scene("res://Scenes/Levels/Stage21.tscn")


func _on_level22_pressed():
	get_tree().change_scene("res://Scenes/Levels/Stage22.tscn")


func _on_level23_pressed():
	get_tree().change_scene("res://Scenes/Levels/Stage23.tscn")


func _on_level24_pressed():
	get_tree().change_scene("res://Scenes/Levels/Stage24.tscn")


func _on_level25_pressed():
	get_tree().change_scene("res://Scenes/Levels/Stage25.tscn")


func _on_level26_pressed():
	get_tree().change_scene("res://Scenes/Levels/Stage26.tscn")


func _on_level27_pressed():
	get_tree().change_scene("res://Scenes/Levels/Stage27.tscn")


func _on_level28_pressed():
	get_tree().change_scene("res://Scenes/Levels/Stage28.tscn")


func _on_level29_pressed():
	get_tree().change_scene("res://Scenes/Levels/Stage29.tscn")


func _on_level30_pressed():
	get_tree().change_scene("res://Scenes/Levels/Stage30.tscn")


func _on_level31_pressed():
	get_tree().change_scene("res://Scenes/Levels/Stage31.tscn")
