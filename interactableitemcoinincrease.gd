extends Area2D

var interacting = false
var cost = 0
var goldincrease = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	
	cost = randi_range(1,Globals.floor) * randi_range(3,5)
	goldincrease = randi_range(1,3)
	
	$itemdescription.text = "Cost:" + str(cost) + str("\n") + "Extra coin gain: " + str(goldincrease)
	
	$itemdescription.visible = false
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if interacting == true and Input.is_key_pressed(KEY_E) and Globals.gold >= cost:
		Globals.gold -= cost
		Globals.goldextragain += goldincrease
		get_parent().queue_free()
		print(Globals.goldextragain)
			

func _on_body_entered(body):
	if body.name == "player" and interacting == false:
		interacting = true
		$itemdescription.visible = true
		
func _on_body_exited(body):
	if body.name == "player":
		interacting = false
		$itemdescription.visible = false
