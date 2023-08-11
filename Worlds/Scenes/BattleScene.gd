extends Node2D

var ehealth = 3
var health = 3
var mana = 0
onready var mana1Sprite = $Control/PlayerBox/PlayerBox/HandMIcons/HBoxContainer/Mana1
onready var mana2Sprite = $Control/PlayerBox/PlayerBox/HandMIcons/HBoxContainer/Mana2
onready var mana3Sprite = $Control/PlayerBox/PlayerBox/HandMIcons/HBoxContainer/Mana3
onready var heart1Sprite = $Control/PlayerBox/PlayerBox/HandMIcons/Hearts/Heart1
onready var heart2Sprite = $Control/PlayerBox/PlayerBox/HandMIcons/Hearts/Heart2
onready var heart3Sprite = $Control/PlayerBox/PlayerBox/HandMIcons/Hearts/Heart3
onready var Eheart1Sprite = $Control/EnemyBox/HandMIcons/Hearts/EHeart1
onready var Eheart2Sprite = $Control/EnemyBox/HandMIcons/Hearts/EHeart2
onready var Eheart3Sprite = $Control/EnemyBox/HandMIcons/Hearts/EHeart3
onready var Eheart4Sprite = $Control/EnemyBox/HandMIcons/Hearts2/EHeart1
onready var Eheart5Sprite = $Control/EnemyBox/HandMIcons/Hearts2/EHeart2
onready var Eheart6Sprite = $Control/EnemyBox/HandMIcons/Hearts2/EHeart3


var inBattle = false

func _process(delta):
	if mana == 0:
		mana1Sprite.hide()
		mana2Sprite.hide()
		mana3Sprite.hide()
	elif mana == 1:
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
	inBattle = true
	health = 3
	mana = 0
	get_parent().get_node("Character").maxspeed = 0
	$Camera2D.current = true
	Global.playBattle()
	$PlayerTime.start()
	if enemychoice == 1:
		ehealth = 4
		$Enemy/EnemySprite.texture = load("res://Monsters/Sprites/DeerMan.png")
		$Control/EnemyBox/Icon.texture = load("res://Monsters/Icons/DeerMan.png")
		deer()
	elif enemychoice == 2:
		ehealth = 3
		$Enemy/EnemySprite.texture = load("res://Monsters/Sprites/WallLeech.png")
		$Control/EnemyBox/Icon.texture = load("res://Monsters/Icons/WallLeech.png")
		leech()
	elif enemychoice == 3:
		ehealth = 5
		$Enemy/EnemySprite.texture = load("res://Monsters/Sprites/EyeMonster.png")
		$Control/EnemyBox/Icon.texture = load("res://Monsters/Icons/EyeMan.png")
		eye()
	elif enemychoice == 4:
		ehealth = 6
		$Enemy/EnemySprite.texture = load("res://Monsters/Sprites/PlantGiant.png")
		$Control/EnemyBox/Icon.texture = load("res://Monsters/Icons/PlantGiant.png")
		flame()
	if ehealth == 6:
		Eheart1Sprite.show()
		Eheart2Sprite.show()
		Eheart3Sprite.show()
		Eheart4Sprite.show()
		Eheart5Sprite.show()
		Eheart6Sprite.show()
	elif ehealth == 5:
		Eheart1Sprite.show()
		Eheart2Sprite.show()
		Eheart3Sprite.show()
		Eheart4Sprite.show()
		Eheart5Sprite.show()
		Eheart6Sprite.hide()
	elif ehealth == 4:
		Eheart1Sprite.show()
		Eheart2Sprite.show()
		Eheart3Sprite.show()
		Eheart4Sprite.show()
		Eheart5Sprite.hide()
		Eheart6Sprite.hide()
	elif ehealth == 3:
		Eheart1Sprite.show()
		Eheart2Sprite.show()
		Eheart3Sprite.show()
		Eheart4Sprite.hide()
		Eheart5Sprite.hide()
		Eheart6Sprite.hide()
	elif ehealth == 2:
		Eheart1Sprite.show()
		Eheart2Sprite.show()
		Eheart3Sprite.hide()
		Eheart4Sprite.hide()
		Eheart5Sprite.hide()
		Eheart6Sprite.hide()
	elif ehealth == 1:
		Eheart1Sprite.show()
		Eheart2Sprite.hide()
		Eheart3Sprite.hide()
		Eheart4Sprite.hide()
		Eheart5Sprite.hide()
		Eheart6Sprite.hide()
	elif ehealth == 0:
		Eheart1Sprite.hide()
		Eheart2Sprite.hide()
		Eheart3Sprite.hide()
		Eheart4Sprite.hide()
		Eheart5Sprite.hide()
		Eheart6Sprite.hide()

func deer():
	$DeerTime.start()
	$AnimationPlayer.play("Deer")
func leech():
	$AnimationPlayer.play("Leech2")
	$LeechTime.start()
	$LeechTime2.start()
func eye():
	$AnimationPlayer.play("Eye")
func flame():
	$AnimationPlayer.play("Leech")


func _on_BattleStarter_start_battle(enemychoice):
	setup(enemychoice)
func _on_BattleStarter2_start_battle(enemychoice):
	setup(enemychoice)
func _on_BattleStarter3_start_battle(enemychoice):
	setup(enemychoice)
func _on_BattleStarter4_start_battle(enemychoice):
	setup(enemychoice)

func _on_PlayerTime_timeout():
	if mana < 3:
		mana +=1

func _on_Enemy_area_entered(area):
	$Enemy/EDarkHit.emitting = true
	ehealth -= 1
	if ehealth == 6:
		Eheart1Sprite.show()
		Eheart2Sprite.show()
		Eheart3Sprite.show()
		Eheart4Sprite.show()
		Eheart5Sprite.show()
		Eheart6Sprite.show()
	elif ehealth == 5:
		Eheart1Sprite.show()
		Eheart2Sprite.show()
		Eheart3Sprite.show()
		Eheart4Sprite.show()
		Eheart5Sprite.show()
		Eheart6Sprite.hide()
	elif ehealth == 4:
		Eheart1Sprite.show()
		Eheart2Sprite.show()
		Eheart3Sprite.show()
		Eheart4Sprite.show()
		Eheart5Sprite.hide()
		Eheart6Sprite.hide()
	elif ehealth == 3:
		Eheart1Sprite.show()
		Eheart2Sprite.show()
		Eheart3Sprite.show()
		Eheart4Sprite.hide()
		Eheart5Sprite.hide()
		Eheart6Sprite.hide()
	elif ehealth == 2:
		Eheart1Sprite.show()
		Eheart2Sprite.show()
		Eheart3Sprite.hide()
		Eheart4Sprite.hide()
		Eheart5Sprite.hide()
		Eheart6Sprite.hide()
	elif ehealth == 1:
		Eheart1Sprite.show()
		Eheart2Sprite.hide()
		Eheart3Sprite.hide()
		Eheart4Sprite.hide()
		Eheart5Sprite.hide()
		Eheart6Sprite.hide()
	elif ehealth == 0:
		Eheart1Sprite.hide()
		Eheart2Sprite.hide()
		Eheart3Sprite.hide()
		Eheart4Sprite.hide()
		Eheart5Sprite.hide()
		Eheart6Sprite.hide()
		exitBattle()
func _on_Character_area_entered(area):
	$Character/DarkHit.emitting = true
	health -= 1
	if health == 3:
		heart1Sprite.show()
		heart2Sprite.show()
		heart3Sprite.show()
	elif health == 2:
		heart1Sprite.show()
		heart2Sprite.show()
		heart3Sprite.hide()
	elif health == 1:
		heart1Sprite.show()
		heart2Sprite.hide()
		heart3Sprite.hide()
	elif health == 0:
		heart1Sprite.hide()
		heart2Sprite.hide()
		heart3Sprite.hide()
func exitBattle():
	inBattle = false
	$DeerTime.stop()
	$LeechTime.stop()
	$LeechTime2.stop()
	get_parent().get_node("Character/Camera2D").current = true
	get_parent().get_node("Character").maxspeed = 16
	
	
