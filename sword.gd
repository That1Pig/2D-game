extends StaticBody2D

var swordlock = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	visible = false
	position = Vector2(position.x, -2000)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(swordlock)
	if Input.is_key_pressed(KEY_Q):
		if swordlock == false:
			
			swordlock = true
			position = Vector2(get_parent().playerx,get_parent().playery)
			print("q pressed and timer started")
			$AnimatedSprite2D.play("swordspriteanimation")
			visible = true
			$AnimationPlayer.play("swordmovementanimation")
			await get_tree().create_timer(0.5).timeout
			print("timer ended")
			position = Vector2(position.x,-2000)
			visible = false
			swordlock = false
			
