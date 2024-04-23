extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$stats.text = "Health: " + str(Globals.health) + "/" + str(Globals.maxhealth) + str("\n") + "Attack: " + str(Globals.basedamage) + str("\n") + "Defence: " + str(Globals.armour) + ", " + str((Globals.armour_res - 1 ) * 100) + "% Resistance" + str("\n") + "Extra Coin Gain: " + str(Globals.goldextragain) + str("\n") + "Crit Rate: " + str(Globals.critrate) + str("\n") + "Crit Damage: " + str(Globals.critmultiplier) + "x"
	$coin.text = "Coins: " + str(Globals.gold)
