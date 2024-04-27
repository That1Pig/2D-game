extends CharacterBody2D

var direction = 1
var speed = 150
var damageamount = 15 + randi_range(Globals.floor,Globals.floor*2)
var enemyhealth = 40 + (5 * Globals.floor - 5)
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var immune = false

#Movement and wall bounce
func _physics_process(delta):
	velocity.x = direction * speed * -1
	move_and_slide()
	if is_on_wall():
		direction = direction*-1
		scale.x = scale.x * -1
		
	if not is_on_floor():
		velocity.y += gravity * delta
	if is_on_floor():
		velocity.y -= 400
		
	if is_on_wall_only():
		velocity.y *= -1
		
#Detects player nearby	
func _on_area_2d_body_entered(body):
	if body.name == "player":
		speed = 200

#Undetects player nearby	
func _on_area_2d_body_exited(body):
	if body.name == "player":
		speed = 150	

#Damages player
func _on_damagearea_body_entered(body):
	if body.name == "player":
		body.damageamount = damageamount
		body.hit = true
		body.velocity.x=0

#Undamages player
func _on_damagearea_body_exited(body):
	if body.name == "player":
		body.hit = false

#Hit by player weapon
func _on_damagearea_area_entered(area):
	if immune == false:
		if area.name == "weapon":
			immune = true
			modulate.a = 0.5
			speed = -20
			enemyhealth -= Globals.playerdamage
			if enemyhealth <= 0:
				Globals.gold += round((randi_range(30,40) / 10) + Globals.goldextragain)
				queue_free()
			await get_tree().create_timer(0.2).timeout
			speed = 150
			modulate.a = 1
			immune = false
