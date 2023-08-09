extends Node2D



func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	self.position.y += 0.02


func _on_HitBox_area_entered(area):
	queue_free()
