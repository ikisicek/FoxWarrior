extends Area2D

const SPEED = 150
var velocity = Vector2()
var direction = 1 #sluzi da pucamo u stranu na kojoj je okrenut igrac

func _ready():
	pass
		
	
func set_fireball_direction (dir): #nasa funkcija
	direction = dir
	if dir == -1:
		$AnimatedSprite.flip_h = true

func _physics_process(delta):
	velocity.x = SPEED * delta * direction #direction je 1 ili -1, ovisno o strani
	translate(velocity)
	$AnimatedSprite.play("shoot")

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_FireballRed_body_entered(body):
	if "Enemy" in body.name:
		body.dead(2) #argument 2 - snaga koliko ozljedni enemyja
	if "Parrot" in body.name:
		body.dead()
		global.kill = global.kill + 1
	if "Bat" in body.name:
		body.dead()
		global.kill = global.kill + 1
	if "Carniplant" in body.name:
		body.dead()
		global.kill = global.kill + 1
	if "Baloon" in body.name:
		body.dead()
	queue_free()
