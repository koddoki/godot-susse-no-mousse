extends Node2D

@onready var player_detector := $PlayerDetector
@onready var animation_player := $AnimationPlayer

var player_inside = false
signal a


#func _ready():
	#player_detector.body_shape_entered.connect(_player_entered_area)
	#player_detector.body_shape_exited.connect(_player_exited_area)


func _process(delta):
	if player_inside and Input.is_action_just_pressed("ui_accept"):
		emit_signal("a")


func _on_player_detector_body_entered(body):
	if body is CharacterBody2D:
		player_inside = true
		animation_player.play("open-close")


func _on_player_detector_body_exited(body):
	if body is CharacterBody2D:
		player_inside = false
		animation_player.play_backwards("open-close")
