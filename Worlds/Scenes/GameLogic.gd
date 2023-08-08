extends Node2D

export var Money = 10
var DeerSprite = load("res://Units/Sprites/DeerMan.png")
var LeechSprite = load("res://Units/Sprites/WallLeech.png")
var EyeSprite = load("res://Units/Sprites/EyeMonster.png")
var FireSprite = load("res://Units/Sprites/PlantGiant.png")
var selectedUnit = 0

func _ready():
	get_parent().get_node("GameUI/HBoxContainer/VBoxContainer/Money").text = String(Money)

func _process(delta):
	$Mouse.position = get_global_mouse_position()
	if Input.is_action_just_pressed("Lclick"):
		spawnUnit()

func _on_DeerMan_button_up():
	selectedUnit = 1
	$Mouse.texture = DeerSprite

func _on_WallLeech_button_up():
	selectedUnit = 2
	$Mouse.texture = LeechSprite

func _on_EyeMonster_button_up():
	selectedUnit = 3
	$Mouse.texture = EyeSprite

func _on_FlameMonster_button_up():
	selectedUnit = 4
	$Mouse.texture = FireSprite

func spawnUnit():
	pass
