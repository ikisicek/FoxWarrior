extends KinematicBody2D

#const GRAVITY = 10
export(int) var SPEED = 50
const FLOOR = Vector2(0, 0)

var direction = 1 #smjer hodanja

var velocity = Vector2()

var is_dead = false #varijabla za destroy enemyja

export(int) var hp = 1  #varijabla da mozemo mijenjat snagu enemyja

export(Vector2) var size = Vector2(1,1) #varijabla za velicinu enemyja

onready var hplabel = $HPLabel

func _ready():
	scale = size
	#hplabel.clear()
	hplabel.add_text(str(hp))
	pass 
#u funkciju dead dodajemo argument damage - sluzi za razlikovanje razornosti fireball-a
func dead(damage):  #nasa funkcija koja se pokrece kada zelimo ubit enemyja
	hp = hp - damage #smanjuje se hp protivnika za 1 svaki put kad je pogoden
	$AnimationPlayer.play("hit")
	if hp < 0:
		hp = 0
	hplabel.clear()
	hplabel.add_text(str(hp))
	if hp <= 0: #kada snaga enemy postane nula izvedi ovo dole
		global.kill = global.kill + 1
		is_dead=true
		velocity = Vector2(0,0)
		$AnimatedSprite.play("dead")  #kada je enemy mrtav pokreni dead animaciju
		$CollisionShape2D.queue_free()   #maknu collision kad je mrtav
		$Timer.start() #pokreni timer da nestane
		if global.zvukovi == true:
			$AudioStreamPlayer2D.play()
		if scale > Vector2(1, 1): #ako je enemy velik (standardna velicina je (1,1), ako je veci od toga pozivamo funkciju za shake screen
			get_parent().get_parent().get_node("ScreenShake").screen_shake(1,10,100) #pokrecemo node ScreenShake koji poziva funkciju screen_shake
		else:
			#get_parent().get_parent().get_node("ScreenShake").screen_shake(1,3,30)
			get_parent().get_parent().get_node("ScreenShake").screen_shake(1,1,1)
			
		
			
func _physics_process(delta):
	if is_dead == false:
		
		velocity.x = SPEED * direction #brzina put pozitivno/negativno, ovisno o smjeru
		
		if direction == 1:
			$AnimatedSprite.flip_h = true
		else:
			$AnimatedSprite.flip_h = false
			
		$AnimatedSprite.play("walk")
		
		velocity.y = 0
		
		#velocity = move_and_slide(velocity, FLOOR)
		velocity = move_and_slide(velocity, FLOOR)
		
	if get_slide_count() > 0:
		for i in range (get_slide_count()):
			if "Player" in get_slide_collision(i).collider.name:
				get_slide_collision(i).collider.dead()
		

func _on_Timer_timeout():
	queue_free()

func _on_Area2D_body_entered(body):
	if "Player" in body.name:
		direction = direction * 1
	else:
		direction = direction * -1
		