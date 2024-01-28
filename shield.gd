extends Area2D

var shieldlock = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$shieldsprite.visible = false
	set_collision_layer_value(2,false)
	shieldlock = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if shieldlock == false and Input.is_key_pressed(KEY_E) or Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		shieldlock = true
		set_collision_layer_value(2,true)
		
		if Globals.directionfacing == "left":
			$shieldsprite.visible = true
			rotation = deg_to_rad(0)
			_shieldreset()
		elif Globals.directionfacing == "right":
			$shieldsprite.visible = true
			rotation = deg_to_rad(180)
			_shieldreset()
	$cooldownanimationtimer.value = ($Timer.time_left * 100)

func _shieldreset() -> void:
	await get_tree().create_timer(1).timeout
	set_collision_layer_value(2,false)
	$Timer.start()
	$shieldsprite.visible = false
	await get_tree().create_timer(1).timeout
	shieldlock = false
	
func _on_timer_timeout():
	shieldlock = false
	
