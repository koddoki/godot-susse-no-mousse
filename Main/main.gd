extends Node

@export var first_scene : PackedScene


func _ready():
	if first_scene != null:
		var first_scene_instance = first_scene.instantiate()
		add_child(first_scene_instance)


func scene_transition(next_scene : PackedScene):
	pass
