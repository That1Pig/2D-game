extends CharacterBody2D

const JUMP_VELOCITY = -400.0
var friction = 25
var hit = false
var immune = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var directionfacing = ""
var damageamount
var onboost = false
var stuck = false
var stuckboost = false
var healthstorage

func _physics_process(delta):
	Globals.playerx = global_position.x
	Globals.playery = global_position.y
	Globals.fullposition = global_position
	
	#Links healthbar to health
	get_node("HealthBar").value = Globals.health
	
	if hit == true and immune == false and Globals.shortimmunity == false:
		get_node("sprite").modulate.a = 0.1
		immune = true
		healthstorage = (Globals.health - damageamount + Globals.armour) * Globals.armour_res
		if (damageamount - Globals.armour) * Globals.armour_res <= 0:
			Globals.health = Globals.health-1
		else:
			Globals.health = healthstorage
		await get_tree().create_timer(0.75).timeout
		immune = false
		get_node("sprite").modulate.a = 1
	if hit == true and immune == false and Globals.shortimmunity == true:
		get_node("sprite").modulate.a = 0.5
		immune = true
		healthstorage = (Globals.health - damageamount + Globals.armour) * Globals.armour_res
		if (damageamount - Globals.armour) * Globals.armour_res <= 0:
			Globals.health = Globals.health-1
		else:
			Globals.health = healthstorage
		await get_tree().create_timer(0.05).timeout
		immune = false
		get_node("sprite").modulate.a = 1
		Globals.shortimmunity=false
	$HealthValue.text = str(Globals.health)



	if is_on_wall() and is_on_floor():
		stuck = true
	else:
		stuck = false
	if stuck == true:
		if stuckboost == false:
			stuckboost = true
			position.y -= 0.25
			if Input.is_key_pressed(KEY_LEFT) or Input.is_key_pressed(KEY_A):
				#scale.x = -.2
				velocity.x = move_toward(velocity.x,-300.0,50)
				Globals.directionfacing = "left"
				Globals.directionfacing_x = "left"
		
			if Input.is_key_pressed(KEY_RIGHT) or Input.is_key_pressed(KEY_D):
				#scale.x = .2
				velocity.x = move_toward(velocity.x,300.0,50)
				Globals.directionfacing = "right"
				Globals.directionfacing_x = "right"
			print("went over bump")
			await get_tree().create_timer(0.1).timeout
			stuckboost = false

	if Globals.health <= 0:
		friction = 25
		Globals.health = 100
		hit = false
		immune = false
		directionfacing = ""
		Globals.armour = 0
		Globals.armour_res = 1
		onboost = false
		stuck = false
		stuckboost = false
		Globals.maxhealth = 100
		Globals.critrate = 10
		Globals.critmultiplier = 1.5
		Globals.basedamage = 10
		Globals.crithit = false
		Globals.roomprogress = 0
		Globals.keyfound = false
		Globals.floor = 1
		Globals.shortimmunity = false
		Globals.gold = 0
		Globals.goldextragain = 0
		get_tree().change_scene_to_file("res://dungeon.tscn")
	friction = move_toward(friction,25,1)

	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if Input.is_key_pressed(KEY_LEFT) or Input.is_key_pressed(KEY_A):
		#scale.x = -.2
		velocity.x = move_toward(velocity.x,-300.0,50)
		Globals.directionfacing = "left"
		Globals.directionfacing_x = "left"
		
	if Input.is_key_pressed(KEY_RIGHT) or Input.is_key_pressed(KEY_D):
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
