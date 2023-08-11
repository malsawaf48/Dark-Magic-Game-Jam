extends Area2D

var EdarkIce = preload("res://Monsters/SpellsScenes/EdarkIce.tscn")

func _ready():
	pass # Replace with function body.


func _on_DeerTime_timeout():
	var EdarkIceIns = EdarkIce.instance()
	get_parent().get_parent().add_child(EdarkIceIns)
	EdarkIceIns.position = $EMagicPoint.global_position
