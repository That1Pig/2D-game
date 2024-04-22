extends Node2D

var direction = 1
var damageamount = 10 + randi_range(Globals.floor,Globals.floor*2)
var enemyhealth = 300
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var immune = false
var boss1projectilelaunch = preload("res://boss_1_projectile.tscn")
var boss1projectilethrown = false

func _ready():
	pass

func _physics_process(delta):
	
	if boss1projectilethrown==false:
		
		boss1projectilethrown=true
		await get_tree().create_timer(1).timeout
		for i in range(20):
			var newboss1projectile = boss1projectilelaunch.instantiate()
			get_parent().add_child(newboss1projectile)
			await get_tree().create_timer(0.1).timeout
		await get_tree().create_timer(1.5).timeout
		for i in range(30):
			var newboss1projectile = boss1projectilelaunch.instantiate()
			get_parent().add_child(newboss1projectile)
			await get_tree().create_timer(0.01).timeout
		await get_tree().create_timer(1).timeout
		for i in range(3):
			for j in range(15):
				var newboss1projectile = boss1projectilelaunch.instantiate()
				get_parent().add_child(newboss1projectile)
				await get_tree().create_timer(0.01).timeout
			await get_tree().create_timer(0.6).timeout
		
		boss1projectilethrown=false
	
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
				queue_free()
				get_parent().get_node("Label").visible = true
			await get_tree().create_timer(0.2).timeout
			modulate.a = 1
			immune = false
