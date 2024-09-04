extends Marker2D

@export var horacio : Curve
@export var level : Node2D


@onready var animation_player = $AnimationPlayer

signal spawning_time


func play_animation():
	animation_player.play("spawn")


func emit_signal_spawning_time():
	emit_signal("spawning_time")


