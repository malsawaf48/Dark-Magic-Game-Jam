extends Control


func _ready():
	pass # Replace with function body.


func _on_CheckBox_toggled(button_pressed):
	if $CheckBox.pressed == true:
		Global.Sbloom()
	elif $CheckBox.pressed == false:
		Global.Rbloom()


func _on_Play_pressed():
	get_tree().change_scene("res://Worlds/Scenes/World.tscn")


func _on_Exit_pressed():
	get_tree().quit()
