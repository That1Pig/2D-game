extends Node2D
var randomitem = 0
var crititem = preload("res://item_crit_increase.tscn")
var damageitem = preload("res://item_damage_increase.tscn")
var defitem = preload("res://item_def_increase.tscn")
var coinitem = preload("res://item_coin_increase.tscn")
var healthitem = preload("res://item_health_increase.tscn")
var maxhealthitem = preload("res://item_maxhealth_increase.tscn")

# Called when the node enters the scene tree for the first time.

func _ready():
	randomitem = randi_range(1,6)
	
	if randomitem == 1:
		var newcrititem = crititem.instantiate()
		add_child(newcrititem)
	if randomitem == 2:	
		var newdamageitem = damageitem.instantiate()
		add_child(newdamageitem)
	if randomitem == 3:
		var newdefitem = defitem.instantiate()
		add_child(newdefitem)
	if randomitem == 4:
		var newcoinitem = coinitem.instantiate()
		add_child(newcoinitem)
	if randomitem == 5:
		var newhealthitem = healthitem.instantiate()
		add_child(newhealthitem)
	if randomitem == 6:
		var newmaxhealthitem = maxhealthitem.instantiate()
		add_child(newmaxhealthitem)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
