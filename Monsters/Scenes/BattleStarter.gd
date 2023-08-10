extends Node2D

signal start_battle(enemychoice)
export var sprite = 1
var deerSprite = load("res://Monsters/Sprites/DeerMan.png")
var leechSprite = load("res://Monsters/Sprites/WallLeech.png")
var eyeSprite = load("res://Monsters/Sprites/EyeMonster.png")
var flameSprite = load("res://Monsters/Sprites/PlantGiant.png")
var canStart = false
func _ready():
	if sprite == 1:
		$Sprite.texture = deerSprite
	elif sprite == 2:
		$Sprite.texture = leechSprite
	elif sprite == 3:
		$Sprite.texture = eyeSprite
	elif sprite == 4:
		$Sprite.texture = flameSprite

func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and canStart == true:
		canStart = false
		emit_signal("start_battle", sprite)

func _on_Area2D_body_entered(body):
	$Label.show()
	canStart = true
func _on_Area2D_body_exited(body):
	$Label.hide()
	canStart = false
