extends Node2D


var current_level : Level
signal return_to_map


func _ready():
	pass


func goto_scene(next_level : PackedScene):
	var next_level_instance = next_level.instantiate()
	if next_level_instance is Level:
		call_deferred("_deferred_goto_scene", next_level_instance)
		return
	push_error("INPUT ERROR: next_level doesn't extends Level")


func _deferred_goto_scene(next_level : Level):
	if current_level != null:
		current_level.free()
	current_level = next_level
	current_level.end.connect(complete_level)
	add_child(current_level)


func complete_level():
	if current_level != null:
		current_level.call_deferred("free")
	return_to_map.emit()
