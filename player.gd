extends CharacterBody2D

const JUMP_VELOCITY = -400.0
var friction = 25
var playerx = position.x
var playery = position.y
var health = 100
var smallhit = false
var mediumhit = false
var largehit = false
var immune = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	
	playerx = position.x
	playery = position.y
	
	#Links healthbar to health
	get_node("HealthBar").value = health
	
	#Changes health depending on strength of hit
	# Small hit = -5
	# Medium hit = -10
	# Large hit = -20
	if smallhit == true and immune == false:
		immune = true
		health = health - 5
		await get_tree().create_timer(0.75).timeout #change this to be better later on
		immune = false
	
	if mediumhit == true and immune == false:
		immune = true
		health = health - 10
		await get_tree().create_timer(0.75).timeout #change this to be better later on
		immune = false
	
	if largehit == true and immune == false:
		immune = true
		health = health - 20
		await get_tree().create_timer(1.25).timeout #change this to be better later on
		immune = false
	
	#Iframe animation
	if immune == true:
		get_node("sprite").modulate.a = 0.1
	else:
		get_node("sprite").modulate.a = 1
	
	#Label Update
	$HealthValue.text = str(health)
	
	

	friction = move_toward(friction,25,1)

	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if Input.is_key_pressed(KEY_LEFT):
		#scale.x = -.2
		velocity.x = move_toward(velocity.x,-300.0,50)
	if Input.is_key_pressed(KEY_RIGHT):
		#scale.x = .2
		velocity.x = move_toward(velocity.x,300.0,50)

	velocity.x = move_toward(velocity.x,0.0,friction)
			
	move_and_slide()

	
	
	

#var actionable_finder
#var next_nearest_actionable
#var nearest_actionable
#
#func check_nearest_actionable() -> void:
#	var areas: Array[Area2D] = actionable_finder.get_overlapping_areas()
#	var shortest_distance: float = INF
#	var next_nearest_actionable: Actionable = null
#	for area in areas:
#		var distance: float = area.global_position.distance_to(global_position)
#		if distance < shortest_distance:
#			shortest_distance = distance
#			next_nearest_actionable = area
#	if next_nearest_actionable != nearest_actionable or not is_instance_valid(next_nearest_actionable):
#		nearest_actionable = next_nearest_actionable
#		#Events.emit_signal("nearest_actionable_changed", nearest_actionable)
