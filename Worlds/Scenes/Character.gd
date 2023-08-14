extends Area2D

var darkMagic = preload("res://Character/SpellsScenes/DarkMagic.tscn")
var darkIce = preload("res://Character/SpellsScenes/DarkIce.tscn")
var ghost = preload("res://Character/SpellsScenes/ghost.tscn")
var Laser =  preload("res://Character/SpellsScenes/Laser.tscn")
var Flame = preload("res://Character/SpellsScenes/Flame.tscn")

var speed = 0.35

func _process(delta):
	if Input.is_action_just_pressed("1"):
		_on_DarkSpell_pressed()
	elif Input.is_action_just_pressed("2"):
		_on_DarkIce_pressed()
	elif Input.is_action_just_pressed("3"):
		_on_Ghost_pressed()
	elif Input.is_action_just_pressed("4"):
		_on_DarkLightning_pressed()
	elif Input.is_action_just_pressed("5"):
		_on_DarkFire_pressed()

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

func _on_DarkIce_pressed():
	if get_parent().mana >= 2:
		var darkIceIns = darkIce.instance()
		get_parent().get_parent().add_child(darkIceIns)
		darkIceIns.position = $MagicPoint.global_position
		get_parent().mana -= 2


func _on_Ghost_pressed():
	if get_parent().mana >= 1:
		var ghostIns = ghost.instance()
		add_child(ghostIns)
		get_parent().mana -= 1


func _on_DarkLightning_pressed():
	if get_parent().mana >= 2:
		var LaserIns = Laser.instance()
		get_parent().get_parent().add_child(LaserIns)
		LaserIns.position = $MagicPoint.global_position
		get_parent().mana -= 2

func _on_DarkFire_pressed():
	if get_parent().mana >= 3:
		var FlameIns = Flame.instance()
		get_parent().get_parent().add_child(FlameIns)
		FlameIns.position = $MagicPoint.global_position
		get_parent().get_node("FlameDelay").start()
		get_parent().mana -= 3
func _on_FlameDelay_timeout():
	var FlameIns2 = Flame.instance()
	get_parent().get_parent().add_child(FlameIns2)
	FlameIns2.position = $MagicPoint.global_position
