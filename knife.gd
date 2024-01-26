extends Area2D
var dest = Vector2()
var direction = Vector2()
var speed = 400

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

var damageamount = randi_range(Globals.floor,Globals.floor*2)

#Damages player
func _on_damagearea_body_entered(body):
	if body.name == "player":
		body.damageamount = damageamount
		body.hit = true
		body.velocity.x=0

#Undamages player
func _on_damagearea_body_exited(body):
	if body.name == "player":
		body.hit = false
		
func _on_timer_timeout():
	queue_free()
