extends Area2D
var dest = Vector2()
var direction = Vector2()
var speed = 200


# Called when the node enters the scene tree for the first time.
func _ready():
	dest = Globals.fullposition
	look_at(dest)
	direction = (dest - global_position).normalized()
	
	
func _process(delta):
	position += direction*speed*delta

func _on_area_entered(area):
	if area.name == "shield":
		#$AnimationPlayer.play("knifecollide")
		#await $AnimationPlayer.animation_finished
		queue_free()
