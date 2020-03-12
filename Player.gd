extends KinematicBody2D

var SPEED = 100 #60
const GRAVITY = 10
#const JUMP_POWER = -250
var JUMP_POWER = -250
const FLOOR = Vector2(0, -1)

const FIREBALL = preload("res://Scenes/Fireball.tscn")
const FIREBALLRED = preload("res://Scenes/FireballRed.tscn")

var velocity = Vector2()

var on_ground = false

#varijabla za animaciju pucanja
var is_attacking = false

var is_dead = false
var is_win = false

var fireball_power = 1

#touch kretanja:
var left_touch = false
var right_touch = false
var jump_touch = false
var shoot_touch = false

#var buttonleft = get_parent().get_node("Controls/Left")
#var buttonright = get_parent().get_node("Controls/Right")
#var buttonshoot = get_parent().get_node("Controls/Shoot")
#var buttonjump = get_parent().get_node("Controls/Up")
var jumptime = 0
var speedtime = 0
var besmrtan = false
var shieldtime = 0

var jump_count = 0
var jump_count_number = 0


func _ready():
	$Shield.play("empty")
	$JumpUp.play("empty")
	$SpeedUp.play("empty")	

func _physics_process(delta):
	
	if is_dead == false and is_win==false: 
		if Input.is_action_pressed("ui_right") or right_touch == true:
			#if (is_attacking == false or is_attacking==true) or is_on_floor() == false:
			if is_attacking == false or is_on_floor() == false:
				velocity.x = SPEED
				if is_attacking == false:
					$AnimatedSprite.play("run")
					$AnimatedSprite.flip_h = false
					if sign($Position2D.position.x) == -1:
						$Position2D.position.x *= -1 #ako je nasa pozicija prema desno sutiramo desno
		elif Input.is_action_pressed("ui_left") or left_touch == true:
			#if (is_attacking == false or is_attacking==true) or is_on_floor()==false:
			if is_attacking == false or is_on_floor()==false:
				velocity.x = -SPEED
				if is_attacking == false:
					$AnimatedSprite.play("run")
					$AnimatedSprite.flip_h = true
					if sign($Position2D.position.x) == 1:
						$Position2D.position.x *= -1 
		else:
			velocity.x = 0
			if on_ground == true && is_attacking == false:
				$AnimatedSprite.play("idle")
			
		if Input.is_action_just_pressed("ui_up") or jump_touch == true:
			if is_attacking == false:
				if on_ground == true:
					velocity.y = JUMP_POWER
					on_ground = false
					jump_touch = false

				if jump_count<jump_count_number:
					jump_count += 1
					velocity.y = JUMP_POWER
					on_ground = false
				
		if on_ground == true:
			jump_count = 0
						
		if Input.is_action_just_pressed("ui_select") or shoot_touch == true && is_attacking == false:
			if is_on_floor():
				velocity.x = 0
			is_attacking = true
			$AnimatedSprite.play("attack")
			#ako je snaga fireball 1 pucaj obicne ako je 2 pucaj crvene
			var fireball = null
			if fireball_power == 1:
				fireball = FIREBALL.instance()  #instanca vatrene lopte
				if global.zvukovi == true:
					$AudioFireball.play()
			elif fireball_power == 2:
				fireball = FIREBALLRED.instance()
				if global.zvukovi == true:
					$AudioRedFireball.play()
			if sign($Position2D.position.x) == 1:
				fireball.set_fireball_direction(1)
			else:
				fireball.set_fireball_direction(-1)
			get_parent().add_child(fireball)
			fireball.position = $Position2D.global_position #pozicija na kojoj će nastat vatrene lopte
			
		#velocity.y = velocity.y + GRAVITY :
		velocity.y += GRAVITY
	
		if is_on_floor():
			if on_ground == false:
				is_attacking = false
			on_ground = true
		else:
			if is_attacking == false:
				on_ground = false
				if velocity.y < 0:
					$AnimatedSprite.play("jump")
				else:
					$AnimatedSprite.play("fall")
					
			
		velocity = move_and_slide(velocity, FLOOR)
		
		#definiranje u kojim slucajevima umre player:
		if get_slide_count() > 0:  
			for i in range(get_slide_count()):
				if "Enemy" in get_slide_collision(i).collider.name:
					#get_parent().get_node("CanvasLayer/YouDied").visible = true
					dead()
				if "Parrot" in get_slide_collision(i).collider.name:
					#get_parent().get_node("CanvasLayer/YouDied").visible = true
					dead()
				if "Carniplant" in get_slide_collision(i).collider.name:
					#get_parent().get_node("CanvasLayer/YouDied").visible = true
					dead()
				if "Bat" in get_slide_collision(i).collider.name:
					#get_parent().get_node("CanvasLayer/YouDied").visible = true
					dead()
				
						
#funkcija za definiranje kad igrac umre
func dead():
	if besmrtan == false:
		is_dead = true
		velocity = Vector2(0,0)
		$AnimatedSprite.play("dead")
		$CollisionShape2D.queue_free()
		$Timer.start()
		global.kill = 0
		if global.zvukovi == true:
			$AudioDead.play()
		get_parent().get_node("AudioStreamPlayer").stop()
		get_parent().get_node("CanvasLayer/YouDied").visible = true
	
	
func deadTime():
	is_dead = true
	velocity = Vector2(0,0)
	$AnimatedSprite.play("dead")
	#$Timer2.start()
	global.kill = 0
	if global.zvukovi == true:
		$AudioDead.play()
	#get_tree().change_scene("res://Scenes/Levels/TitleScreen.tscn")
	get_parent().get_node("AudioStreamPlayer").stop()
	get_parent().get_node("GameOverCanvas/Restart").visible = true
	get_parent().get_node("GameOverCanvas/Quit").visible = true
	
	
func _on_AnimatedSprite_animation_finished():
	is_attacking = false

#timer za dead
func _on_Timer_timeout():
	#get_tree().change_scene("res://Scenes/TitleScreen.tscn")
	get_parent().get_node("GameOverCanvas/Restart").visible = true
	get_parent().get_node("GameOverCanvas/Quit").visible = true
	
	
func crown_power_up():
	fireball_power = 2
	
func _on_Timer2_timeout():
	#get_tree().change_scene("res://Scenes/TitleScreen.tscn")
	get_parent().get_node("GameOverCanvas/Restart").visible = true
	get_parent().get_node("GameOverCanvas/Quit").visible = true
	print("test")


func _on_VisibilityNotifier2D_screen_exited():
	if global.zvukovi == true:
		$AudioDead.play()
	get_parent().get_node("CanvasLayer/YouDied").visible = true
	$AnimatedSprite.play("dead")
	get_parent().get_node("GameOverCanvas/Restart").visible = true
	get_parent().get_node("GameOverCanvas/Quit").visible = true
	#get_tree().change_scene("res://Scenes/TitleScreen.tscn")

func win():
	is_win = true
	velocity.y = 0
	velocity.x = 0


#test jump
func more_jump():
	$JumpHightTimer.start()
	

##


func _on_Left_pressed():
	left_touch = true

func _on_Right_pressed():
	right_touch = true

func _on_Up_pressed():
	jump_touch = true
	
func _on_Shoot_pressed():
	shoot_touch = true
	
	

func _on_Left_released():
	left_touch = false
	
func _on_Right_released():
	right_touch = false
	
func _on_Up_released():
	jump_touch = false

func _on_Shoot_released():
	shoot_touch = false


func _on_JumpHightTimer_timeout():
	jumptime = jumptime + 1
	if jumptime < 250:
		jump_count_number = 1
		JUMP_POWER = -200
		$JumpUp.play("jumpup")
	else:
		jump_count_number = 0
		JUMP_POWER = -250
		$JumpUp.play("empty")
	
func besmrtan():
	$Shieldtimer.start()
#	$Shield.play("shield")
#	besmrtan = true
#
#func nema_stita():
#	$Shield.play("empty")
#	besmrtan = false
	
func speedUp():
	$SpeedUpTimer.start()

func _on_SpeedUpTimer_timeout():
	speedtime = speedtime + 1
	if speedtime < 100:
		$SpeedUp.play("speedup")
		SPEED = 120
	else:
		$SpeedUp.play("empty")
		SPEED = 100
		

func _on_Shieldtimer_timeout():
	shieldtime = shieldtime + 1
	if shieldtime <= 25:
		$Shield.play("shield")
		besmrtan = true
	elif shieldtime > 25 and shieldtime <30:
		$Shield.play("red")
		besmrtan = true
		$Shield/ShieldTicTac.play()
	else:
		$Shield/ShieldTicTac.stop()
		$Shield.play("empty")
		besmrtan = false
