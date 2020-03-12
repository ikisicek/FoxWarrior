extends Control

onready var killlabel = get_node("CanvasLayer/KillTextLabel")

func _ready():
	var killtext = "TOTAL KILLS : "+String(global.total_kill)	
	killlabel.clear()
	killlabel.add_text(killtext)	
	
#	if global.total_kill < 30:
#		$world2.disabled = true

func _on_MenuButton_pressed():
	#get_tree().change_scene("res://Scenes/TitleScreen.tscn")
	SceneChanger.change_scene("res://Scenes/TitleScreen.tscn")

func _on_world1_pressed():
	#get_tree().change_scene("res://Scenes/Worlds/World1.tscn")
	SceneChanger.change_scene("res://Scenes/Worlds/World1.tscn")

func _on_world2_pressed():
	#get_tree().change_scene("res://Scenes/Worlds/World2.tscn")
	SceneChanger.change_scene("res://Scenes/Worlds/World2.tscn")


func _on_world3_pressed():
	SceneChanger.change_scene("res://Scenes/Worlds/World3.tscn")
	
#boss buttons:

func _on_boss1_pressed():
	SceneChanger.change_scene("res://Scenes/Levels/StageBoss.tscn")


func _on_boss2_pressed():
	SceneChanger.change_scene("res://Scenes/Levels/StageBoss2.tscn")


func _on_Button_pressed():
	if $glavni.position.x < 1550:
		$glavni.position.x += 200


func _on_RIGHT_pressed():
	if $glavni.position.x > 200:
		$glavni.position.x -= 200



