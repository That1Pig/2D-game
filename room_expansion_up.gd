extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	if body.name == "player":
		queue_free()
		#Shuffles rooms to pick one
		Globals.down_links.shuffle()
		var new_room_name = "res://" + Globals.down_links[0] + ".tscn"
		
		#Loads new room
		var up_room = load(new_room_name)
		var new_up_room = up_room.instantiate()
		Globals.linkpos1 = new_up_room.get_node("room_expansion_down").position
		Globals.linkpos2 = self.position
		
		#Finds position and adds room
		new_up_room.position = Globals.linkpos2 - Globals.linkpos1 + Vector2(0,-54)
		get_parent().add_child(new_up_room)
		
		#Creates area that frees nearby links
		var free_nearby_links = preload("res://free_nearby_links.tscn")
		var new_free_nearby_links = free_nearby_links.instantiate()
		new_free_nearby_links.position = Globals.linkpos2
		get_parent().add_child(new_free_nearby_links)
		
		Globals.roomprogress += 1
		print(Globals.roomprogress)
		
		if Globals.roomprogress == 3:
			Globals.left_links.append("key_room")
			Globals.right_links.append("key_room")
			print("key room is now possible")
		
	#Detects for nearby free link areas
func _on_area_entered(area):
	if area.name == "free_nearby_links":
		print("queue freed by free nearby links")
		queue_free()
