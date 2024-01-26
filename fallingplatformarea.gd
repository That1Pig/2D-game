extends Area2D

var lockfall = false
func _on_body_entered(body):
	if body.name == "player":
		if lockfall == false:
			lockfall = true
			for i in 60:
				get_parent().position.y += 0.5	
				await get_tree().create_timer(0.05).timeout
			get_parent().queue_free()
				

