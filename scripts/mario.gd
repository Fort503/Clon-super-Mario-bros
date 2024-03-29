extends CharacterBody2D
const speed = 90
const runSpeed = 150
var currentSpeed = 150
const  gravedad = 40
const salto = -650
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var sonido_salto = $sonidoSalto
var direction = 0
var esGrande = false

func  _ready():
	pass	
	
func _physics_process(delta):
	manejarAnimaciones()
	_aplicarGravedad()
	move_and_slide()
	controles()
	pass
	
func _aplicarGravedad():
	velocity.y += gravedad

func manejarAnimaciones():
	if esGrande:
		pass
	else:
		if not is_on_floor():
			animated_sprite_2d.play("jump_small")
		elif velocity.x != 0:
			animated_sprite_2d.play("run_small")
		else:
			animated_sprite_2d.play("idle_small")
	

func controles():
	if Input.is_action_pressed("rum"):
		currentSpeed = runSpeed
	else:
		currentSpeed = speed
	
	if Input.is_action_pressed("move_rigth"):
		animated_sprite_2d.flip_h = false
		velocity.x = currentSpeed
	elif Input.is_action_pressed("move_left"):
		animated_sprite_2d.flip_h = true;
		velocity.x = -currentSpeed
	else:
		velocity.x = 0
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = salto
		sonido_salto.play()
		

