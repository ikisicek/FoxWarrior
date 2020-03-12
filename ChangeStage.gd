extends Area2D

export(String, FILE, "*.tscn") var target #ovo služi kako bi u editoru mogli odabrati o kojem se levelu radi, da ga ne moramo ručno (script Variables - target stage)
var wintime = 0

func _ready():
	$Sprite.play("default")

#ako je player u colision sa changestage promijeni stage
func _on_ChangeStage_body_entered(body):
	if "Player" in body.name:
		$WinAnimated.visible = true
		if global.zvukovi == true:
			$AudioWin.play()
		$WinTimer.start()
		get_parent().get_node("Player").win()
		global.level_finished = true
		print (global.baloon)
		#get_parent()._on_GameTimer_timeout()
	
	

func _on_WinTimer_timeout():
	wintime += 1
	if wintime > 0:
		get_tree().change_scene(target)
		
