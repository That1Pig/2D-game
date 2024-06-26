extends Area2D

var interacting = false
var cost = 0
var critrateincrease = 0
var critdamageincrease = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	
	cost = randi_range(1,Globals.floor) * randi_range(4,5)
	critrateincrease = randi_range(1,2)
	critdamageincrease = round(cost * Globals.floor * 0.3)
	
	$itemdescription.text = "Cost:" + str(cost) + str("\n") + "Crit rate increase: " + str(critrateincrease) + "%" + str("\n") + "Crit damage increase: " + str(critdamageincrease) + "%"
	
	$itemdescription.visible = false
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if interacting == true and Input.is_key_pressed(KEY_E) and Globals.gold >= cost:
		Globals.gold -= cost
		Globals.critrate += critrateincrease
		Globals.critmultiplier += critdamageincrease/100
		get_parent().queue_free()
		print(Globals.critrate)
		print(Globals.critmultiplier)

			

func _on_body_entered(body):
	if body.name == "player" and interacting == false:
		interacting = true
		$itemdescription.visible = true
		
func _on_body_exited(body):
	if body.name == "player":
		interacting = false
		$itemdescription.visible = false
