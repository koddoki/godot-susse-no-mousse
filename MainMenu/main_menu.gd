extends Node2D

@onready var animation_player = $AnimationPlayer
@onready var map := $MainMap


func _on_play_button_pressed():
	animation_player.play("start_game")
