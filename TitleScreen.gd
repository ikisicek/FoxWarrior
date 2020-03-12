extends Node

func _ready():
	$VBoxContainer/Start.grab_focus()
	
func _physics_process(delta):
	if $VBoxContainer/Start.is_hovered() == true:
		$VBoxContainer/Start.grab_focus()
	
	if $VBoxContainer/Exit.is_hovered() == true:
		$VBoxContainer/Exit.grab_focus()

func _on_Start_pressed():
	get_tree().change_scene("res://Scenes/Worlds.tscn")
	
func _on_Exit_pressed():
	get_tree().quit()
	
