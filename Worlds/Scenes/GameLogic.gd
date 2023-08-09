extends Node2D

export var Money = 10
var DeerSprite = load("res://Units/Sprites/DeerMan.png")
var LeechSprite = load("res://Units/Sprites/WallLeech.png")
var EyeSprite = load("res://Units/Sprites/EyeMonster.png")
var FireSprite = load("res://Units/Sprites/PlantGiant.png")
var selectedUnit = 0
var canSpawn = true
onready var DeerMan = preload("res://Units/Scenes/DeerMan.tscn")
onready var WallLeech = preload("res://Units/Scenes/WallLeech.tscn")
onready var EyeMonster = preload("res://Units/Scenes/EyeMonster.tscn")
onready var FlameMonster = preload("res://Units/Scenes/FlameMonster.tscn")

func _ready():
	get_parent().get_node("GameUI/HBoxContainer/VBoxContainer/Money").text = String(Money)

func _process(delta):
	$Mouse.position = get_global_mouse_position()
	if Input.is_action_just_pressed("Lclick") and canSpawn == true:
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
	var spawnPos = get_global_mouse_position()
	if selectedUnit == 1:
		var DeerIns = DeerMan.instance()
		get_parent().add_child(DeerIns)
		DeerIns.position = spawnPos
	elif selectedUnit == 2:
		var LeechIns = WallLeech.instance()
		get_parent().add_child(LeechIns)
		LeechIns.position = spawnPos
	elif selectedUnit == 3:
		var EyeIns = EyeMonster.instance()
		get_parent().add_child(EyeIns)
		EyeIns.position = spawnPos
	elif selectedUnit == 4:
		var FlameIns = FlameMonster.instance()
		get_parent().add_child(FlameIns)
		FlameIns.position = spawnPos


func _on_DeerMan_mouse_entered():
	canSpawn = false
func _on_WallLeech_mouse_entered():
	canSpawn = false
func _on_EyeMonster_mouse_entered():
	canSpawn = false
func _on_FlameMonster_mouse_entered():
	canSpawn = false
func _on_DeerMan_mouse_exited():
	canSpawn = true
func _on_WallLeech_mouse_exited():
	canSpawn = true
func _on_EyeMonster_mouse_exited():
	canSpawn = true
func _on_FlameMonster_mouse_exited():
	canSpawn = true
