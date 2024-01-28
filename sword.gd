extends Area2D
var swordactive = false

# Called when the node enters the scene tree for the first time.
func _ready():
	visible=false
	set_collision_layer_value(2,false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_key_pressed(KEY_Q) or Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		if swordactive==false:
			swordactive=true
			position = Vector2(Globals.playerx,Globals.playery)
			set_collision_layer_value(2,true)
			visible=true
			Globals.playerdamage = 10
			if Globals.directionfacing_x == "left":
				$AnimationPlayer.play("swordmovementleft")
			if Globals.directionfacing_x == "right":
				$AnimationPlayer.play("swordmovementright")
			await get_tree().create_timer(0.5).timeout
			set_collision_layer_value(2,false)
			visible=false
			swordactive=false
		
