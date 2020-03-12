extends KinematicBody2D

const FIREBALL = preload("res://Scenes/EnemyBullet2.tscn")

const GRAVITY = 10
export(int) var SPEED = 30
const FLOOR = Vector2(0, -1)

var direction = 1 #smjer hodanja

var velocity = Vector2()

var is_dead = false #varijabla za destroy enemyja
var is_shoot = false

export(int) var hp = 1  #varijabla da mozemo mijenjat snagu enemyja

export(Vector2) var size = Vector2(1,1) #varijabla za velicinu enemyja

onready var hplabel = $HPLabel
var shottime = 0
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
			get_parent().get_parent().get_node("ScreenShake").screen_shake(1,3,30)
			
		
			
func _physics_process(delta):
	if is_dead == false and is_shoot == false:
		
		velocity.x = SPEED * direction #brzina put pozitivno/negativno, ovisno o smjeru
		
		if direction == 1:
			$AnimatedSprite.flip_h = true
		else:
			$AnimatedSprite.flip_h = false
			
		$AnimatedSprite.play("walk")
		
		velocity.y += GRAVITY
		
		velocity = move_and_slide(velocity, FLOOR)
		
	#promjeni smjer kada takne zid:
	if is_on_wall():
		direction = direction * -1
		$RayCast2D.position.x *= -1 #kada mijenjamo smjer enemyja moramo i smjer RayCasta, inace bi ostao na krivoj strani
		$Position2D.position.x *= -1
		
	#rayCast: da promijeni smjer kada nema collision
	if $RayCast2D.is_colliding() == false:
		direction = direction * -1 #kada RayCast ne dira podlogu više naš enemy mijena smjer
		$RayCast2D.position.x *= -1
		$Position2D.position.x *= -1
		
		#dok se krece ako je u collision sa player ubij ga
	if get_slide_count() > 0:
		for i in range (get_slide_count()):
			if "Player" in get_slide_collision(i).collider.name:
				get_slide_collision(i).collider.dead()
		

func _on_Timer_timeout():
	queue_free()


func _on_ShootTImer_timeout():
	shottime = shottime + 1
	var fireball = null
	if shottime % 3 == 0:
		$ShootAudio.play()
		is_shoot = true
		$AnimatedSprite.play("shoot")
		fireball = FIREBALL.instance()
		get_parent().add_child(fireball)
		
		fireball.position = $Position2D.global_position
		if direction == 1:
			fireball.set_fireball_direction(1)
		else:
			$Position2D.position.x = $Position2D.position.x * (-1)
			fireball.set_fireball_direction(-1)
	else :
		is_shoot = false
