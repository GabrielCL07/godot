extends CharacterBody2D

@onready var player = $"."
@onready var level = $".."
@onready var coyote_time = $coyoteTime as Timer

var cJump := true
var levouDano = 0
var Morreu = 0

const SPEED = 150.0 #definindo a velocidade
const JUMP_VELOCITY = -280.0 #definindo a velocidade do pulo

var estaPulando = false
var tDam 
signal morri

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") #definindo a gravidade

func _physics_process(delta):
	# Add the gravity.
	if !is_on_floor():
		velocity.y += gravity * delta #colocando força de queda quando não está pisando no chão

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and cJump:
		velocity.y = JUMP_VELOCITY #definindo força do pulo
		estaPulando = true
	elif is_on_floor():
		estaPulando = false

	if is_on_floor() and !cJump:
		cJump = true
	elif cJump and coyote_time.is_stopped():
		coyote_time.start()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right") 
	if !tDam:
		if direction:
			velocity.x = direction * SPEED #andar se apertar uma tecla...
			$AnimatedSprite2D.scale.x = direction
			if !estaPulando:
					$AnimatedSprite2D.play("Run")
		else:
					$AnimatedSprite2D.play("Idle")
					velocity.x = move_toward(velocity.x, 0, SPEED) #...se não fica parado
					$AnimatedSprite2D.play("Idle")
					if velocity.y > 0:
						$AnimatedSprite2D.play("Jump")
		move_and_slide()

func _levouDano():
	tDam = true
	$AnimatedSprite2D.play("Hurt")
	await $AnimatedSprite2D.animation_finished
	tDam = false
	Global.Life -= 1
	if Global.Life <= 0:
		player._Morreu()
		level.morreu.connect(_Morreu)

func _Morreu():
	print("Morri ;-;")
	emit_signal("morri")


func _on_coyote_time_timeout():
	cJump = false
