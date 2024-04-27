extends Area2D

var interacting = false
var cost = 0
var maxhealthincrease = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	
	cost = randi_range(1,Globals.floor) * randi_range(3,5)
	maxhealthincrease = round(cost * randi_range(2,4))
	
	$itemdescription.text = "Cost:" + str(cost) + str("\n") + "Max health increase: " + str(maxhealthincrease)
	
	$itemdescription.visible = false
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if interacting == true and Input.is_key_pressed(KEY_E) and Globals.gold >= cost:
		Globals.gold -= cost
		Globals.maxhealth += maxhealthincrease
		Globals.health += maxhealthincrease
		print(Globals.maxhealth)
		get_parent().queue_free()

			

func _on_body_entered(body):
	if body.name == "player" and interacting == false:
		interacting = true
		$itemdescription.visible = true
		
func _on_body_exited(body):
	if body.name == "player":
		interacting = false
		$itemdescription.visible = false
