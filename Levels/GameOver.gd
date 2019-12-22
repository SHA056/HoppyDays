extends Control



func _on_TextureButton_pressed():
#	$AudioStreamPlayer.stream = load("res://SFX/Summer_Park.ogg")
#	$AudioStreamPlayer.play()
	get_tree().change_scene("res://Levels/Level1.tscn")
	