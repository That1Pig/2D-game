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
			set_collision_layer_value(2,true)
			Globals.playerdamage = 10
			if Globals.critrate >= randi_range(1,100):
				$CPUParticles2D.emitting=true
				Globals.playerdamage *= Globals.critmultiplier
				print(Globals.playerdamage)	
			if Globals.directionfacing_x == "left":
				visible=true
				$AnimationPlayer.play("swordmovementleft")
			if Globals.directionfacing_x == "right":
				visible=true
				$AnimationPlayer.play("swordmovementright")
			await get_tree().create_timer(0.5).timeout
			set_collision_layer_value(2,false)
			swordactive=false
			visible=false
