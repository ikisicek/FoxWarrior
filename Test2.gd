extends Control

const BACKGROUND_SPEED = Vector2(2, 0)

func _process(delta):
	$ParallaxBackground.scroll_offset += BACKGROUND_SPEED
	
func _ready():
	#GlobalAudio.play()
	$CanvasLayer/Start.grab_focus()
	
func _physics_process(delta):
	if $CanvasLayer/Start.is_hovered() == true:
		$CanvasLayer/Start.grab_focus()
	
	if $CanvasLayer/Exit.is_hovered() == true:
		$CanvasLayer/Exit.grab_focus()

func _on_Start_pressed():
	get_tree().change_scene("res://Scenes/Map.tscn")
	#$ButtonClickAudio.play()
	

func _on_Settings_pressed():
	get_tree().change_scene("res://Scenes/Instructions.tscn")
	#$ButtonClickAudio.play()


func _on_Exit_pressed():
	get_tree().quit()
	#$ButtonClickAudio.play()


func _on_Training_pressed():
	SceneChanger.change_scene("res://Scenes/Levels/StageTraining.tscn")
