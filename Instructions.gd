extends Node2D


func _ready():
	$AnimatedSprite.play("default")
	if global.audio == true:
		$CheckButton.pressed = true
	
	if global.zvukovi == false:
		$SoundEffects.pressed = false
		
	if global.buttons_visible == false:
		$ButtonsVisible.pressed = false
		
func _on_TextureButton_pressed():
	get_tree().change_scene("res://Scenes/TitleScreen.tscn")


func _on_CheckButton_pressed():
	if GlobalAudio.playing == true:
		GlobalAudio.playing = false
		global.audio = false
	if GlobalAudio.playing == false:
		GlobalAudio.playing = true
		global.audio = true


func _on_SoundEffects_pressed():
	if global.zvukovi == true:
		global.zvukovi = false
	else:
		global.zvukovi = true



func _on_ButtonsVisible_pressed():
	if global.buttons_visible == true:
		global.buttons_visible = false
	else:
		global.buttons_visible = true
