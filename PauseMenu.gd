extends Control

var is_clicked = false

func _ready():
	$VBoxContainer/ResumeButton.grab_focus()

func _physics_process(delta):
	if $VBoxContainer/ResumeButton.is_hovered() == true:
		$VBoxContainer/ResumeButton.grab_focus()
	if $VBoxContainer/QuitButton.is_hovered() == true:
		$VBoxContainer/QuitButton.grab_focus()

func _on_ResumeButton_pressed():
	get_tree().paused = not get_tree().paused
	$VBoxContainer.visible = not $VBoxContainer.visible
	is_clicked = false

func _on_QuitButton_pressed():
	get_tree().paused = not get_tree().paused
	get_tree().change_scene("res://Scenes/TitleScreen.tscn")
	is_clicked = false

func _on_SettingsButton_pressed():
	if is_clicked == false:
		$VBoxContainer/ResumeButton.grab_focus()
		get_tree().paused = not get_tree().paused
		is_clicked = true
		if $VBoxContainer.visible == false:
			$VBoxContainer.visible = true


