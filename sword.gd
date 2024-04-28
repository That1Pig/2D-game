extends Area2D
var swordactive = false

# Called when the node enters the scene tree for the first time.
func _ready():
	visible=false
	set_collision_layer_value(2,false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_key_pressed(KEY_Q) or Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		if swordactive == false:
			swordactive = true
			Globals.playerdamage = Globals.basedamage
			if Globals.critrate >= randi_range(1,100):
				$CPUParticles2D.emitting=true
				Globals.playerdamage *= Globals.critmultiplier
				print(Globals.playerdamage)	
			set_collision_layer_value(2,true)
			visible=true
			if $AnimationPlayer.is_playing():
				if Globals.directionfacing == "left":
					var continueanimation = $AnimationPlayer.current_animation_position
					$AnimationPlayer.stop()
					$AnimationPlayer.play("swordmovementleft")
					$AnimationPlayer.advance(continueanimation)
					await get_tree().create_timer(0.35).timeout
				if Globals.directionfacing == "right":
					var continueanimation = $AnimationPlayer.current_animation_position
					$AnimationPlayer.stop()
					$AnimationPlayer.play("swordmovementright")
					$AnimationPlayer.advance(continueanimation)
					await get_tree().create_timer(0.35).timeout
				visible=false
				swordactive = false
				set_collision_layer_value(2,false)
			else:
				if Globals.directionfacing == "left":
					$AnimationPlayer.play("swordmovementleft")
					await get_tree().create_timer(0.35).timeout
				if Globals.directionfacing == "right":
					$AnimationPlayer.play("swordmovementright")
					await get_tree().create_timer(0.35).timeout
				visible=false
				swordactive = false
				set_collision_layer_value(2,false)
			
	if Globals.directionfacing == "left":
		var continueanimation = $AnimationPlayer.current_animation_position
		$AnimationPlayer.stop()
		$AnimationPlayer.play("swordmovementleft")
		$AnimationPlayer.advance(continueanimation)
		
	if Globals.directionfacing == "right":
		var continueanimation = $AnimationPlayer.current_animation_position
		$AnimationPlayer.stop()
		$AnimationPlayer.play("swordmovementright")
		$AnimationPlayer.advance(continueanimation)
		
