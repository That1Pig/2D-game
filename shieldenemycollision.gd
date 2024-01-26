extends StaticBody2D

var shieldlock = false

# Called when the node enters the scene tree for the first time.
func _ready():
	set_collision_layer_value(2,false)
	shieldlock = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if shieldlock == false and Input.is_key_pressed(KEY_E):
		shieldlock = true
		set_collision_layer_value(2,true)
		_shieldreset()

func _shieldreset() -> void:
	await get_tree().create_timer(1).timeout
	set_collision_layer_value(2,false)
	await get_tree().create_timer(1).timeout
	shieldlock = false
