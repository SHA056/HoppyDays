extends CanvasLayer

onready var LifeCount = $Control/TextureRect/HBoxContainer/LifeCount
onready var CoinCount = $Control/TextureRect/HBoxContainer/CoinCount

func _ready():
	pass

func update_lives(lives_left):
	LifeCount.text = str(lives_left)


func update_coins(coins):
	CoinCount.text = str(coins)
	