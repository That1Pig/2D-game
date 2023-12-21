extends Area2D

var shieldlock = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$shieldsprite.visible = false
	collision_layer = 2
	shieldlock = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if shieldlock == false and Input.is_key_pressed(KEY_E):
		shieldlock = true
		collision_layer = 1
		
		if Globals.directionfacing == "left":
			$shieldsprite.visible = true
			rotation = deg_to_rad(0)
			_shieldreset()
		elif Globals.directionfacing == "right":
			$shieldsprite.visible = true
			rotation = deg_to_rad(180)
			_shieldreset()
		elif Globals.directionfacing == "up":
			$shieldsprite.visible = true
			rotation = deg_to_rad(90)
			_shieldreset()
		elif Globals.directionfacing == "down":
			$shieldsprite.visible = true
			rotation = deg_to_rad(270)
			_shieldreset()
	$cooldownanimationtimer.value = ($Timer.time_left * 100)

func _shieldreset() -> void:
	await get_tree().create_timer(1).timeout
	collision_layer = 2
	$Timer.start()
	$shieldsprite.visible = false
	await get_tree().create_timer(1).timeout
	shieldlock = false
	

func _on_timer_timeout():
	shieldlock = false
	
