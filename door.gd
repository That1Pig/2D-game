extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#Checks if the player has progressed enough for a boss room
func _on_body_entered(body):
	if body.name == "player":
		Globals.floor += 1
		if Globals.floor != 3:
			print("entering floor" + str(Globals.floor))
			
			#Reset floor
			Globals.directionfacing = "right"
			Globals.roomprogress = 0
			print("room progress reset")
			Globals.keyfound = false
			Globals.left_links.erase("floor_exit_room_left")
			Globals.right_links.erase("floor_exit_room_right")
			get_tree().reload_current_scene()
		else:
			get_tree().change_scene_to_file("res://boss_room1.tscn")
