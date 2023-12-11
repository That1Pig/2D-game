extends Area2D

var interacting = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$pressEprompt.visible = false
	$textandbox.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if interacting == true and Input.is_key_pressed(KEY_E):
		$pressEprompt.visible = false
		$textandbox.visible = true

func _on_body_entered(body):
	if body.name == "player" and interacting == false:
		interacting = true
		$pressEprompt.visible = true
		
func _on_body_exited(body):
	if body.name == "player":
		interacting = false
		$textandbox.visible = false
		$pressEprompt.visible = false
