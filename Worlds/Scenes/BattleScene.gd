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
	ehealth = 3
	health = 3
	mana = 0
	get_parent().get_node("Character").maxspeed = 0
	$Camera2D.current = true
	Global.playBattle()
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
	$AnimationPlayer.play("Deer")
func leech():
	$AnimationPlayer.play("Leech")
func eye():
	$AnimationPlayer.play("Eye")
func flame():
	$AnimationPlayer.play("Flame")


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
	if ehealth == 2:
		Eheart1Sprite.show()
		Eheart2Sprite.show()
		Eheart3Sprite.hide()
	elif ehealth == 1:
		Eheart1Sprite.show()
		Eheart2Sprite.hide()
		Eheart3Sprite.hide()
	elif ehealth == 0:
		Eheart1Sprite.hide()
		Eheart2Sprite.hide()
		Eheart3Sprite.hide()
func _on_Character_area_entered(area):
	$Character/DarkHit.emitting = true
	health -= 1
	if health == 2:
		heart1Sprite.show()
		heart2Sprite.show()
		heart3Sprite.hide()
	elif health == 1:
		heart1Sprite.show()
		heart2Sprite.hide()
		heart3Sprite.hide()
