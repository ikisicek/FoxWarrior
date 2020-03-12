extends Area2D

const SPEED = 150
var velocity = Vector2()
var direction = 1 #sluzi da pucamo u stranu na kojoj je okrenut igrac

func _ready():
	pass 

#funkcija za smijer sutiranja :
func set_fireball_direction (dir): #nasa funkcija
	direction = dir
	if dir == -1:
		$AnimatedSprite.flip_h = true

func _physics_process(delta):
	velocity.x = SPEED * delta * direction #direction je 1 ili -1, ovisno o strani
	translate(velocity)
	$AnimatedSprite.play("shoot")

#funkcija da metci nestanu iz igre kad izadu iz ekrana
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

#funkcija za collision metka sa tilesetom, ili sa bilo kojim objektom koji ima collision
func _on_Fireball_body_entered(body):
	if "Player" in body.name:   #kada je metak u collision enemy ubij enemy
		body.dead()
		queue_free()
