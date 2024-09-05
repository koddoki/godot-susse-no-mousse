extends Node2D


var current_level : Level


func _ready():
	pass


func goto_scene(next_level : PackedScene):
	var next_level_instance = next_level.instantiate()
	if next_level_instance is Level:
		call_deferred("_deferred_goto_scene", next_level_instance)
	push_error("INPUT ERROR: next_level doesn't extends Level")


func _deferred_goto_scene(next_level : Level):
	if current_level != null:
		current_level.free()
	current_level = next_level
	current_level.end.connect(return_to_map())
	add_child(current_level)


func return_to_map():
	if current_level != null:
		current_level.call_deferred("free")
