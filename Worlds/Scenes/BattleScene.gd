extends Node2D

var ehealth = 3
var health = 3
var mana = 0
onready var mana1Sprite = $Control/PlayerBox/PlayerBox/HandMIcons/HBoxContainer/Mana1
onready var mana2Sprite = $Control/PlayerBox/PlayerBox/HandMIcons/HBoxContainer/Mana2
onready var mana3Sprite = $Control/PlayerBox/PlayerBox/HandMIcons/HBoxContainer/Mana3

func _process(delta):
	if mana == 1:
		mana1Sprite.show()
		mana2Sprite.hide()
		mana3Sprite.hide()
	elif mana ==2:
		mana1Sprite.show()
		mana2Sprite.show()
		mana3Sprite.hide()
	elif mana ==3:
		mana1Sprite.show()
		mana2Sprite.show()
		mana3Sprite.show()

func setup(var enemychoice):
	ehealth = 3
	health = 3
	mana = 0
	get_parent().get_node("Character").maxspeed = 0
	$Camera2D.current = true
	$PlayerTime.start()
	if enemychoice == 1:
		$Enemy/EnemySprite.texture = load("res://Monsters/Sprites/DeerMan.png")
		$Control/EnemyBox/Icon.texture = load("res://Monsters/Icons/DeerMan.png")
		deer()
	elif enemychoice == 2:
		$Enemy/EnemySprite.texture = load("res://Monsters/Sprites/WallLeech.png")
		$Control/EnemyBox/Icon.texture = load("res://Monsters/Icons/WallLeech.png")
		leech()
	elif enemychoice == 3:
		$Enemy/EnemySprite.texture = load("res://Monsters/Sprites/EyeMonster.png")
		$Control/EnemyBox/Icon.texture = load("res://Monsters/Icons/EyeMan.png")
		eye()
	elif enemychoice == 4:
		$Enemy/EnemySprite.texture = load("res://Monsters/Sprites/PlantGiant.png")
		$Control/EnemyBox/Icon.texture = load("res://Monsters/Icons/PlantGiant.png")
		flame()

func deer():
	$DeerTime.start()
func leech():
	pass
func eye():
	pass
func flame():
	pass


func _on_BattleStarter_start_battle(enemychoice):
	setup(enemychoice)
func _on_BattleStarter2_start_battle(enemychoice):
	setup(enemychoice)
func _on_BattleStarter3_start_battle(enemychoice):
	setup(enemychoice)
func _on_BattleStarter4_start_battle(enemychoice):
	setup(enemychoice)

func _on_PlayerTime_timeout():
	if mana <=3:
		mana +=1
func _on_DeerTime_timeout():
	eIce()
func eIce():
	pass
