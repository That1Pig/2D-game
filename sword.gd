extends Area2D

var swordlock = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	visible = false
	position = Vector2(position.x, -2000)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_key_pressed(KEY_Q):
		#if swordlock == false:
			#swordlock = true
		Globals.playerdamage = 10
		position = Vector2(Globals.playerx,Globals.playery)
		print("q pressed and timer started")
		visible = true
		$AnimatedSprite2D.play("swordspriteanimation")
		if Globals.directionfacing == "right":
			$AnimationPlayer.play("swordmovementright")
		if Globals.directionfacing == "left":
			$AnimationPlayer.play("swordmovementleft")
		
		await get_tree().create_timer(0.5).timeout
		visible = false
		print("timer ended")
		position = Vector2(position.x,-2000)
		
			#swordlock = false
