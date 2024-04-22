extends StaticBody2D

var fireballlaunch = preload("res://fireball.tscn")
var damageamount = 5 + randi_range(Globals.floor,Globals.floor*2)
var enemyhealth = 20 + (5 * Globals.floor - 5)
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var immune = false
var fireballthrown = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if fireballthrown==false:
		fireballthrown=true
		for i in range(5):
			var newfireball = fireballlaunch.instantiate()
			get_parent().add_child(newfireball)
			await get_tree().create_timer(0.15).timeout
		await get_tree().create_timer(0.5).timeout
		for i in range(5):
			var newfireball = fireballlaunch.instantiate()
			get_parent().add_child(newfireball)
			await get_tree().create_timer(0.15).timeout
		await get_tree().create_timer(1.6).timeout
		
		fireballthrown=false

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
			print("weapon collide")
			immune = true
			modulate.a = 0.5
			enemyhealth -= Globals.playerdamage
			print(enemyhealth)
			if enemyhealth <= 0:
				Globals.gold += round((randi_range(30,50) / 10) + Globals.goldextragain)
				print(Globals.gold)
				queue_free()
			await get_tree().create_timer(0.2).timeout
			modulate.a = 1
			immune = false
