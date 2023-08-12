extends Area2D
func _ready():
	$AudioStreamPlayer.play()
func _physics_process(delta):
	position.x += 1.5



func _on_Laser_area_entered(area):
	queue_free()


func _on_Timer_timeout():
	queue_free()
