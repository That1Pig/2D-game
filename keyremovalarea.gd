extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "player":	
		Globals.keyfound = true
		print("key collected")
		Globals.left_links.append("floor_exit_room_left")
		Globals.right_links.append("floor_exit_room_right")
		get_parent().queue_free()
		

