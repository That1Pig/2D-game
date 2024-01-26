extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$expanded.visible = true
	$compressed.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	if body.name == "player":
		body.velocity.y = -600
		$expanded.visible = false
		$compressed.visible = true
		_springboing()

func _on_body_exited(body):
	if body.name == "player":
		$compressed.visible = false
		$expanded.visible = true
		_springunboing()


func _springboing() -> void:
	var tween := create_tween().set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "scale", Vector2(self.scale.x,1.3), 1)
	tween.parallel().tween_property(self, "position", Vector2(self.position.x,self.position.y + 0.5), 0.45)
	
func _springunboing() -> void:
	var tween := create_tween().set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "scale", Vector2(self.scale.x,1), 1)
	tween.parallel().tween_property(self, "position", Vector2(self.position.x,self.position.y - 0.5), 0.45)



