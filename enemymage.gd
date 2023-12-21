extends StaticBody2D

var knifelaunch = preload("res://knife.tscn")
var movesetcooldown = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#load this enemy from a cutscene, once defeated give cutscene check with enemy health
	if movesetcooldown <= 3:
		var randommove = randi_range(1,5)
		#Knife throw
		if randommove == 1:
			var newknife = knifelaunch.instantiate()
			add_child(newknife)
			movesetcooldown += 1
		elif randommove == 2:
			pass
			movesetcooldown += 1
		elif randommove == 3:
			pass
			movesetcooldown += 1
		elif randommove == 4:
			pass
			movesetcooldown += 1
		elif randommove == 5:
			pass
			movesetcooldown += 1
	else:
		await get_tree().create_timer(3).timeout
		movesetcooldown = 0

	
