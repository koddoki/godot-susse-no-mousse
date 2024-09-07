extends Node2D


@export var level : PackedScene
@export var title := "Placeholder"
@export var text := "Placeholder"


@onready var player_detector := $PlayerDetector
@onready var animation_player := $AnimationPlayer
@onready var title_label := $PopUp/VBoxContainer/Title
@onready var text_label := $PopUp/VBoxContainer/Text


signal start_level(level : PackedScene)

var player_inside = false

func _ready():
	title_label.text = title
	text_label.text = text



func _process(_delta):
	if player_inside and Input.is_action_just_pressed("ui_accept"):
		start_level.emit(level)


func _on_player_detector_body_entered(body):
	if body is CharacterBody2D:
		player_inside = true
		animation_player.play("open-close")


func _on_player_detector_body_exited(body):
	if body is CharacterBody2D:
		player_inside = false
		animation_player.play_backwards("open-close")
