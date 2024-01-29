extends Node2D
var door_unlock

# Called when the node enters the scene tree for the first time.
func _ready():
	door_unlock = randi_range(1,2)
	if door_unlock == 1:
		$leftblock.queue_free()
		$room_expansion_right.queue_free()
	else:
		$rightblock.queue_free()
		$room_expansion_left.queue_free()
