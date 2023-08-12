extends Area2D

func _ready():
	$AudioStreamPlayer.play()
func _on_ghost_area_entered(area):
	queue_free()
func _on_Timer_timeout():
	queue_free()
