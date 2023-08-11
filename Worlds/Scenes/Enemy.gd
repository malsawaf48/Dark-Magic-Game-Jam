extends Area2D

var EdarkIce = preload("res://Monsters/SpellsScenes/EdarkIce.tscn")
var EdarkMagic = preload("res://Monsters/SpellsScenes/EdarkMagic.tscn")
var Eghost = preload("res://Monsters/SpellsScenes/Eghost.tscn")

func _ready():
	pass # Replace with function body.


func _on_DeerTime_timeout():
	var EdarkIceIns = EdarkIce.instance()
	get_parent().get_parent().add_child(EdarkIceIns)
	EdarkIceIns.position = $EMagicPoint.global_position


func _on_LeechTime_timeout():
	var EghostIns = Eghost.instance()
	add_child(EghostIns)
	#EghostIns.position = $EMagicPoint.global_position


func _on_LeechTime2_timeout():
	var EdarkMagicIns = EdarkMagic.instance()
	get_parent().get_parent().add_child(EdarkMagicIns)
	EdarkMagicIns.position = $EMagicPoint.global_position
