extends Node

var battleMusic = preload("res://Sounds/Music/for_the_black_lord_loop.wav")
var regularMusic = preload("res://Sounds/Music/dark_heart.wav")
var lvl = 1
func _ready():
	playRegular()

func playBattle():
	$Music.stream = battleMusic
	$Music.play()

func playRegular():
	$Music.stream = regularMusic
	$Music.play()
