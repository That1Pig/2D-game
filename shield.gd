extends Area2D

var shieldactive = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$shieldsprite.visible = false
	set_collision_layer_value(2,false)
	shieldactive = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if shieldactive == false:
		if Input.is_key_pressed(KEY_E) or Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
			shieldactive = true
			$shieldsprite.visible = true
			set_collision_layer_value(2,true)
			await get_tree().create_timer(1.5).timeout
			set_collision_layer_value(2,false)
			$Timer.start()
			$shieldsprite.visible = false
			await get_tree().create_timer(1.5).timeout
			shieldactive = false
			$shieldsprite.visible = false
	$cooldownanimationtimer.value = ($Timer.time_left * 66.666)

	if shieldactive == true:
		if Globals.directionfacing == "left":
			scale.x=5
		else:
			scale.x=-5

func _on_timer_timeout():
	shieldactive = false
