extends Node2D

@onready var word_atractor : = $WordAtractor
@onready var animation_player : = $AnimationPlayer
@onready var dialogue_scene := $DialogueScene

var cliques = 0
var scenarios : Array

signal end


func _ready():
	var json_as_text = FileAccess.get_file_as_string("res://levels/level_1/jsons/first_scene.json")
	dialogue_scene.visible = true
	scenarios = JSON.parse_string(json_as_text)
	next_scene()


func _on_interactible_word_clicado(dialogue_json : String):
	cliques += 1 
	dialogue_scene.visible = true
	var json_as_text = FileAccess.get_file_as_string(dialogue_json)
	scenarios = JSON.parse_string(json_as_text)
	next_scene()


func next_scene():
	if scenarios.size() > 0:
		var scenario = scenarios.pop_back()
		var background = scenario["background"] if scenario.has("background") else null
		var title = scenario["title"] if scenario.has("title") else null
		var text = scenario["text"] if scenario.has("text") else null
		var character_data = scenario["character_data"] if scenario.has("character_data") else null
		dialogue_scene.update_text(title, text)
		dialogue_scene.update_characters(character_data)
		dialogue_scene.update_background(background)
	else:
		emit_signal("end")


func _on_dialogue_scene_next_button_pressed():
	next_scene()
