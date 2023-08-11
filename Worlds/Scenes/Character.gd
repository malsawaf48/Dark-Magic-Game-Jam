extends Area2D

var darkMagic = preload("res://Character/SpellsScenes/DarkMagic.tscn")
var speed = 0.35
func _physics_process(delta):
	if Input.is_action_pressed("ui_down") and position.y <= 58:
		position.y += speed
	elif Input.is_action_pressed("ui_up") and position.y >= 27:
		position.y -= speed



func _on_DarkSpell_pressed():
	if get_parent().mana >= 1:
		var darkMagicIns = darkMagic.instance()
		get_parent().get_parent().add_child(darkMagicIns)
		darkMagicIns.position = $MagicPoint.global_position
		get_parent().mana -= 1
