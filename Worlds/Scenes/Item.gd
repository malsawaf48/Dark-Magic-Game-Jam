extends Node2D

var canInteract = false

func _ready():
	pass # Replace with function body.
	
func _on_Area2D_body_entered(body):
	$Label.show()
	canInteract = true
func _on_Area2D_body_exited(body):
	$Label.hide()
	canInteract = false
