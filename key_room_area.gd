extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "player":
		Globals.left_links.erase("key_room")
		Globals.right_links.erase("key_room")
		print("key rooms removed out of room list")
		print(Globals.left_links)
		print(Globals.right_links)
		print(Globals.up_links)
		print(Globals.down_links)
