extends KinematicBody2D

export (int) var speed = 400
export (int) var jump_speed = -600
export (int) var gravity = 2000

var velocity = Vector2.ZERO
var anim = "idle"

func get_input():
	velocity.x = 0
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed
	if Input.is_action_pressed("ui_left"):
		velocity.x -= speed

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_just_pressed("ui_accept"):
		if is_on_floor():
			velocity.y = jump_speed

	# set run animation
	if is_on_floor():
		if velocity.x == 0:
			anim = "Idle"
		else:
			anim = "Run"
	# set jump animation
	if velocity.y < 0:
		anim = "Fall"
	elif velocity.y > 0:
		anim = "Jump"
	# change direction
	if velocity.x > 0:
		$AnimatedSprite.set_flip_h(false)
	elif velocity.x < 0:
		$AnimatedSprite.set_flip_h(true)
		
	$AnimatedSprite.play(anim)
	
	if Global.Health <= 0:
		get_tree().reload_current_scene()

func _on_KillZone_body_entered(body):
	if body.name == "Player":
		get_tree().reload_current_scene()


