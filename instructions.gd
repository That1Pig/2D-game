extends Label

# Called when the node enters the scene tree for the first time.
func _ready():
	if Globals.floor != 1:
		visible=false
