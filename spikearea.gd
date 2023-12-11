extends Area2D

func _on_body_entered(body):
	if body.name == "player":
		body.smallhit = true

func _on_body_exited(body):
	if body.name == "player":
		body.smallhit = false
