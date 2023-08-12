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

var Beat = false
var inBattle = false
var enemytype = 1

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
	enemytype = enemychoice
	inBattle = true
	health = 3
	mana = 0
	get_parent().get_node("Character").maxspeed = 0
	$Camera2D.current = true
	Global.playBattle()
	$PlayerTime.start()
	if Global.lvl == 1:
		$Control/SpellBox/DarkSpell.show()
	elif Global.lvl == 2:
		$Control/SpellBox/DarkIce.show()
	elif Global.lvl == 3:
		$Control/SpellBox/Ghost.show()
	elif Global.lvl == 4:
		$Control/SpellBox/DarkLightning.show()
	elif Global.lvl == 5:
		$Control/SpellBox/DarkFire.show()
	if health == 3:
		heart1Sprite.show()
		heart2Sprite.show()
		heart3Sprite.show()
	if enemychoice == 1:
		ehealth = 3
		$Enemy/EnemySprite.texture = load("res://Monsters/Sprites/DeerMan.png")
		$Control/EnemyBox/Icon.texture = load("res://Monsters/Icons/DeerMan.png")
		deer()
	elif enemychoice == 2:
		ehealth = 3
		$Enemy/EnemySprite.texture = load("res://Monsters/Sprites/WallLeech.png")
		$Control/EnemyBox/Icon.texture = load("res://Monsters/Icons/WallLeech.png")
		leech()
	elif enemychoice == 3:
		ehealth = 4
		$Enemy/EnemySprite.texture = load("res://Monsters/Sprites/EyeMonster.png")
		$Control/EnemyBox/Icon.texture = load("res://Monsters/Icons/EyeMan.png")
		eye()
	elif enemychoice == 4:
		ehealth = 5
		$Enemy/EnemySprite.texture = load("res://Monsters/Sprites/PlantGiant.png")
		$Control/EnemyBox/Icon.texture = load("res://Monsters/Icons/PlantGiant.png")
		flame()
	elif enemychoice == 5:
		ehealth = 6
		$Enemy/EnemySprite.texture = load("res://Boss/Sprite.png")
		$Control/EnemyBox/Icon.texture = load("res://Boss/icon.png")
		boss()
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
	Beat = true
	
func leech():
	$AnimationPlayer.play("Leech2")
	$LeechTime.start()
	$LeechTime2.start()
	Beat = true
func eye():
	$AnimationPlayer.play("Eye")
	$EyeTime.start()
	Beat = true
func flame():
	$AnimationPlayer.play("Leech")
	$FlameTime.start()
	Beat = true
	
func boss():
	$AnimationPlayer.play("Boss")
	$BossTimer1.start()
	$BossTimer2.start()
	$BossTimer3.start()
	$BossTimer4.start()
	Beat = true

func _on_BattleStarter_start_battle(enemychoice):
	setup(enemychoice)
	get_parent().get_node("BattleStarter").canStart = false
func _on_BattleStarter2_start_battle(enemychoice):
	setup(enemychoice)
	get_parent().get_node("BattleStarter2").canStart = false
func _on_BattleStarter3_start_battle(enemychoice):
	setup(enemychoice)
	get_parent().get_node("BattleStarter3").canStart = false
func _on_BattleStarter4_start_battle(enemychoice):
	setup(enemychoice)
	get_parent().get_node("BattleStarter4").canStart = false
func _on_BattleStarter5_start_battle(enemychoice):
	setup(enemychoice)
	get_parent().get_node("BattleStarter5").canStart = false

func _on_PlayerTime_timeout():
	if mana < 3:
		mana +=1

func _on_Enemy_area_entered(area):
	$Enemy/EDarkHit.emitting = true
	$Enemy/AudioStreamPlayer.play()
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
	$Character/AudioStreamPlayer.play()
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
		Beat = false
		exitBattle()
func exitBattle():
	inBattle = false
	$DeerTime.stop()
	$LeechTime.stop()
	$LeechTime2.stop()
	$EyeTime.stop()
	$FlameTime.stop()
	$BossTimer1.stop()
	$BossTimer2.stop()
	$BossTimer3.stop()
	$BossTimer4.stop()
	if Beat == true and enemytype == 1:
		get_parent().get_node("BattleStarter").queue_free()
	elif Beat == true and enemytype == 2:
		get_parent().get_node("BattleStarter2").queue_free()
	elif Beat == true and enemytype == 3:
		get_parent().get_node("BattleStarter3").queue_free()
	elif Beat == true and enemytype == 4:
		get_parent().get_node("BattleStarter4").queue_free()
	elif Beat == true and enemytype == 5:
		get_parent().get_node("BattleStarter5").queue_free()
		
	if Beat == false and enemytype == 1:
		get_parent().get_node("BattleStarter").canStart = true
	elif Beat == false and enemytype == 2:
		get_parent().get_node("BattleStarter2").canStart = true
	elif Beat == false and enemytype == 3:
		get_parent().get_node("BattleStarter3").canStart = true
	elif Beat == false and enemytype == 4:
		get_parent().get_node("BattleStarter4").canStart = true
	elif Beat == false and enemytype == 5:
		get_parent().get_node("BattleStarter5").canStart = true
	
	get_parent().get_node("Character/Camera2D").current = true
	get_parent().get_node("Character").maxspeed = 24
	Global.playRegular()
	if Beat == true:
		Global.lvl += 1
