extends Control

export(String, FILE, "*.tscn") var next_stage
export(String, FILE, "*.tscn") var restart_stage
onready var killlabel = get_node("KillTextLabel")
export var level_rating = 0
export var baloons_level = 0
var level_baloons = 0

func _ready():
	if global.zvukovi == false:
		$AudioNode/BGDAudio.playing = false
	$Label/AnimationLabel.play("label")
	$Star/AnimationStar.play("star")
	$Foxy.play("idle")
	if (global.level <= level_rating):
		global.level = level_rating
	
	var killtext = "TOTAL KILLS: "+String(global.total_kill)	
	killlabel.clear()
	killlabel.add_text(killtext)	
	
	level_baloons = global.baloon
	
	if level_baloons == 0:
		$Baloons_rating.play("0")
	if level_baloons == 1:
		$Baloons_rating.play("1")
	if level_baloons == 2:
		$Baloons_rating.play("2")
	if level_baloons == 3:
		$Baloons_rating.play("3")
		
################# povezivanje broja skupljenih balona sa levelom
	if baloons_level == 1:
		global_baloons.level1 = level_baloons
	if baloons_level == 2:
		global_baloons.level2 = level_baloons
	if baloons_level == 3:
		global_baloons.level3 = level_baloons
	if baloons_level == 4:
		global_baloons.level4 = level_baloons
	if baloons_level == 5:
		global_baloons.level5 = level_baloons
	if baloons_level == 6:
		global_baloons.level6 = level_baloons
	if baloons_level == 7:
		global_baloons.level7 = level_baloons
	if baloons_level == 8:
		global_baloons.level8 = level_baloons
	if baloons_level == 9:
		global_baloons.level9 = level_baloons
	if baloons_level == 10:
		global_baloons.level10 = level_baloons
	if baloons_level == 11:
		global_baloons.level11 = level_baloons
	if baloons_level == 12:
		global_baloons.level12 = level_baloons
	if baloons_level == 13:
		global_baloons.level13 = level_baloons
	if baloons_level == 14:
		global_baloons.level14 = level_baloons
	if baloons_level == 15:
		global_baloons.level15 = level_baloons
	if baloons_level == 16:
		global_baloons.level16 = level_baloons
	if baloons_level == 17:
		global_baloons.level17 = level_baloons
	if baloons_level == 18:
		global_baloons.level18 = level_baloons
		
##########################################
	
func _on_NextButton_pressed():
	SceneChanger.change_scene(next_stage)

func _on_RestartButton_pressed():
	SceneChanger.change_scene(restart_stage)
	
func _on_QuitButton_pressed():
	SceneChanger.change_scene("res://Scenes/TitleScreen.tscn")


