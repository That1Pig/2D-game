extends StaticBody2D

var shieldlock = false

# Called when the node enters the scene tree for the first time.
func _ready():
	collision_layer = 2
	shieldlock = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if shieldlock == false and Input.is_key_pressed(KEY_E):
		shieldlock = true
		collision_layer = 3
		
		if Globals.directionfacing == "left":
			rotation = deg_to_rad(0)
			_shieldreset()
		elif Globals.directionfacing == "right":
			rotation = deg_to_rad(180)
			_shieldreset()
		elif Globals.directionfacing == "up":
			rotation = deg_to_rad(90)
			_shieldreset()
		elif Globals.directionfacing == "down":
			rotation = deg_to_rad(270)
			_shieldreset()

func _shieldreset() -> void:
	await get_tree().create_timer(1).timeout
	collision_layer = 2
	await get_tree().create_timer(1).timeout
	shieldlock = false
