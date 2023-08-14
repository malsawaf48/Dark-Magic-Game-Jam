extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer/Anicamera.current = true
	$AnimationPlayer.play("1start")


func _on_AnimationPlayer_animation_finished(anim_name):
	$Character/Camera2D.current = true


func _on_Button_pressed():
	get_tree().change_scene("res://Menus/MainMenu.tscn")
