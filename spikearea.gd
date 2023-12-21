extends Area2D

var damageamount = 5

func _on_body_entered(body):
	if body.name == "player":
		body.damageamount = damageamount
		body.hit = true

func _on_body_exited(body):
	if body.name == "player":
		body.hit = false
