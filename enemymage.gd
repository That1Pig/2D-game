extends StaticBody2D

var fireballlaunch = preload("res://fireball.tscn")
var damageamount = 5 + randi_range(Globals.floor,Globals.floor*2)
var enemyhealth = 20 + (5 * Globals.floor - 5)
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var immune = false
var fireballthrown = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if fireballthrown==false:
		fireballthrown=true
		for i in range(5):
			var newfireball = fireballlaunch.instantiate()
			add_child(newfireball)
			await get_tree().create_timer(0.2).timeout
		await get_tree().create_timer(2).timeout
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
			if Globals.critrate >= randi_range(1,100):
				enemyhealth -= Globals.playerdamage * Globals.critmultiplier
			else:
				enemyhealth -= Globals.playerdamage
			print(enemyhealth)
			if enemyhealth <= 0:
				queue_free()
			await get_tree().create_timer(0.2).timeout
			modulate.a = 1
			immune = false
		
	

			
