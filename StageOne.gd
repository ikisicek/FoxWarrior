extends Node2D

export var starttime = 0
var timetimer = 0
export var level_kills = 0
var star_value

onready var timelabel = get_node("CanvasLayer/TimeLabel")
onready var killlabel = get_node("CanvasLayer/KillLabel")
onready var coinlabel = get_node("CanvasLayer/CoinLabel")

func _process(delta):
	if $GameOverCanvas/Restart.visible == true:
		$CanvasLayerPause/PauseMenu/SettingsButton.visible = false
	if Input.is_action_pressed("tab"):
		get_tree().reload_current_scene()
	
	var killtext = String(global.kill)	
	killlabel.clear()
	killlabel.add_text(killtext)	

	if global.kill > level_kills:
		level_kills = global.kill
		
	var cointext = String(global.coins)
	coinlabel.clear()
	coinlabel.add_text(cointext)
		
func _on_GameTimer_timeout():
	starttime = starttime - 1
	timelabel.clear()
	#timelabel.add_text("Time : " + str(starttime))
	timelabel.add_text(str(starttime))
	
	if starttime <= 0:
		timelabel.clear()
		timelabel.add_text("Time : 0")
		$Player.deadTime()
		$CanvasLayer/TimeOut.visible = true
		$CanvasLayer/TimeOut/TimeTimer.start()
		$AudioStreamPlayer.stop()
		
func _ready():
	if global.buttons_visible == false:
		$Controls/Left.visible = false
		$Controls/Right.visible = false
		$Controls/Up.visible = false
		$Controls/Shoot.visible = false
	if global.zvukovi == false:
		$AudioStreamPlayer.playing = false
	GlobalAudio.stop()
	global.baloon = 0
	global.level_finished = false
	#$EnemiesParrot/Parrot/AnimationBird1.play("bird1")
	#$EnemiesParrot/Parrot2/AnimationBird2.play("bird")
	#$EnemiesParrot/Parrot3/AnimationBird3.play("bird")
	#$EnemiesBat/Bat/AnimationBat1.play("bat")
	#$EnemiesBat/Bat2/AnimationBat2.play("bat")
	#$EnemiesBat/Bat4/AnimationBat4.play("bat")
	#$EnemiesBat/Bat5/AnimationBat5.play("bat")
	print("level kill je")
	print (level_kills)
	
func _on_TimeTimer_timeout():
	timetimer += 1
	if timetimer > 20:
		get_tree().change_scene("res://Scenes/TitleScreen.tscn")
		
func _on_SettingsButton_pressed():
	$CanvasLayerPause/PauseMenu/ColorRect.visible = true


func _on_StageOne_tree_exited():
	if global.audio == true:
		GlobalAudio.play()
	#global.total_kill = global.total_kill + global.kill
	if global.level_finished == true:
		global.total_kill = global.total_kill + level_kills
		print(global.total_kill)


func _on_StageOne_tree_entered():
	global.kill = 0
	global.total_kill = global.total_kill - level_kills
	print("global je: ")
	print (global.total_kill)


func _on_Restart_pressed():
	if visible == true:
		get_tree().reload_current_scene()
		
func _on_Quit_pressed():
	if visible == true:
		get_tree().change_scene("res://Scenes/TitleScreen.tscn")

#func _on_TextureProgress_changed():
#	if global.baloon == global.baloon + 1:
#		star_value = $CanvasLayer/TextureProgress.get_value()
#		$CanvasLayer/TextureProgress.set_value(star_value + 33)


func _on_Baloon_star_collected():
	star_value = $CanvasLayer/TextureProgress.get_value()
	$CanvasLayer/TextureProgress.set_value(star_value + 33)



