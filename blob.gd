extends CharacterBody2D

var direction = 1
var speed = 50
var damageamount = 10 + randi_range(Globals.floor,Globals.floor*2)
var enemyhealth = 30 + (5 * Globals.floor - 5)
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var immune = false

func _ready():
	$AnimatedSprite2D.frame = 0

#Movement and wall bounce
func _physics_process(delta):
	velocity.x = direction * speed * -1
	move_and_slide()
	if is_on_wall():
		direction = direction*-1
		scale.x = scale.x * -1
		
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if not $raycast_floor.is_colliding():
		direction = direction*-1
		scale.x = scale.x * -1
		#https://www.youtube.com/watch?v=AG4g5jaQYo0
		
#Detects player nearby	
func _on_area_2d_body_entered(body):
	if body.name == "player":
		$AnimatedSprite2D.frame = 1
		speed = 100

#Undetects player nearby	
func _on_area_2d_body_exited(body):
	if body.name == "player":
		$AnimatedSprite2D.frame = 0
		speed = 50	

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
				Globals.gold += round((randi_range(10,30) / 10) + Globals.goldextragain)
				queue_free()
			await get_tree().create_timer(0.2).timeout
			speed = 50
			modulate.a = 1
			immune = false
