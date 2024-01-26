extends CharacterBody2D

const JUMP_VELOCITY = -400.0
var friction = 25
var health = 100
var hit = false
var immune = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var directionfacing = ""
var damageamount
var armour = 0
var armour_res = 1
var onboost = false

func _physics_process(delta):
	Globals.playerx = global_position.x
	Globals.playery = global_position.y
	Globals.fullposition = global_position
	
	#Links healthbar to health
	get_node("HealthBar").value = health
	
	if hit == true and immune == false:
		immune = true
		health = (health - damageamount + armour) * armour_res
		await get_tree().create_timer(0.75).timeout
		immune = false
	
	#Iframe animation
	if immune == true:
		get_node("sprite").modulate.a = 0.1
	else:
		get_node("sprite").modulate.a = 1
	
	#Label Update
	$HealthValue.text = str(health)


#load to main scene
#	if health <= 0:
#		get_tree().l


	friction = move_toward(friction,25,1)

	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if Input.is_key_pressed(KEY_LEFT):
		#scale.x = -.2
		velocity.x = move_toward(velocity.x,-300.0,50)
		Globals.directionfacing = "left"
		Globals.directionfacing_x = "left"
		
	if Input.is_key_pressed(KEY_RIGHT):
		#scale.x = .2
		velocity.x = move_toward(velocity.x,300.0,50)
		Globals.directionfacing = "right"
		Globals.directionfacing_x = "right"

	if Input.is_key_pressed(KEY_UP):
		Globals.directionfacing = "up"
		Globals.directionfacing_y = "up"
		
	if Input.is_key_pressed(KEY_DOWN):
		Globals.directionfacing = "down"
		Globals.directionfacing_y = "down"

	velocity.x = move_toward(velocity.x,0.0,friction)
			
	move_and_slide()
	
	if onboost == true:
		if Globals.directionfacing == "left":
			velocity.x = -600
		if Globals.directionfacing == "right":
			velocity.x = 600
