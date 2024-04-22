extends Node2D
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Globals.fullposition + Vector2(randi_range(-80,80),randi_range(-80,80))
	await get_tree().create_timer(0.7).timeout
	modulate.g = 0
	modulate.b = 0
	$crosshair.visible = false
	$rock.visible = true
	$rock.set_collision_layer_value(0,true)
	$rock.set_collision_mask_value(1,true)
	$rock.set_collision_mask_value(2,true)
	$rock.set_collision_mask_value(3,true)
	await get_tree().create_timer(0.5).timeout
	queue_free()
