extends CharacterBody2D

var direction = 1
var speed = 50
var damageamount = 10

func _ready():
	$AnimatedSprite2D.frame = 0

func _physics_process(delta):
	velocity.x = direction * speed * -1
	move_and_slide()
	if is_on_wall():
		direction = direction*-1
		scale.x = scale.x * -1
		
func _on_area_2d_body_entered(body):
	if body.name == "player":
		$AnimatedSprite2D.frame = 1
		speed = 100

func _on_area_2d_body_exited(body):
	if body.name == "player":
		$AnimatedSprite2D.frame = 0
		speed = 50	

func _on_damagearea_body_entered(body):
	if body.name == "player":
		body.damageamount = damageamount
		body.hit = true

func _on_damagearea_body_exited(body):
	if body.name == "player":
		body.hit = false
