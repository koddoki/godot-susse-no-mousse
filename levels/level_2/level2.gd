extends Node2D

@onready var word_atractor : = $WordAtractor
@onready var animation_player : = $AnimationPlayer
@onready var dialogue_scene := $DialogueScene
@onready var background := $Background

var cliques = 0
var jsons_lidos = 1
var scenarios : Array

signal end


func _ready():
	var json_as_text = FileAccess.get_file_as_string("res://levels/level_2/jsons/FASE2P1.json")
	dialogue_scene.visible = true
	scenarios = JSON.parse_string(json_as_text)
	next_scene()
	print("_ready()")


func _on_interactible_word_clicado():
	cliques += 1 
	
	print(cliques)
	print("Ulli, socorro")
	
	match cliques:
		4:
			next_scene()
			dialogue_scene.visible = true
			animation_player.play("constituicao")
		11:
			next_scene()
			dialogue_scene.visible = true
			animation_player.play("susse")


func next_scene():
	print("scenarios.size() :" + str(scenarios.size()))
	if scenarios.size() > 0:
		var scenario = scenarios.pop_back()
		var background_path = scenario["background"] if scenario.has("background") else null
		var title = scenario["title"] if scenario.has("title") else null
		var text = scenario["text"] if scenario.has("text") else null
		var character_data = scenario["character_data"] if scenario.has("character_data") else null
		
		dialogue_scene.update_text(title, text)
		dialogue_scene.update_characters(character_data)
		if background_path != null:
			background.texture = load(background_path)
		return
	match jsons_lidos:
		1:
			var json_as_text = FileAccess.get_file_as_string("res://levels/level_2/jsons/FASE2P2.json")
			scenarios = JSON.parse_string(json_as_text)
			
			jsons_lidos += 1
			$InteractibleButtons/SaudePublicaUniversal.visible = true
			$InteractibleButtons/SaudeGratuita.visible = true
			next_scene()
		2:
			var json_as_text = FileAccess.get_file_as_string("res://levels/level_2/jsons/FASE2P3.json")
			scenarios = JSON.parse_string(json_as_text)
			
			jsons_lidos += 1
			$InteractibleButtons/SaudeDireitoTodos.visible = true
			next_scene()
		3:
			var json_as_text = FileAccess.get_file_as_string("res://levels/level_2/jsons/FASE2P4.json")
			scenarios = JSON.parse_string(json_as_text)
			jsons_lidos += 1
			dialogue_scene.visible = false
			
			$InteractibleButtons/DeveresDoEstado.visible = true
			$WordAtractor/Balde.visible = true
		4:
			var json_as_text = FileAccess.get_file_as_string("res://levels/level_2/jsons/FASE2P5.json")
			animation_player.play_backwards("constituicao")
			jsons_lidos += 1
			dialogue_scene.visible = false
			$InteractibleButtons/Universalidade.visible = true
			$InteractibleButtons/Integralidade.visible = true
			$InteractibleButtons/Equidade.visible = true
			$InteractibleButtons/Descentralizacao.visible = true
			$InteractibleButtons/Regionalizacao.visible = true
			$InteractibleButtons/Hierarquizacao.visible = true
			$InteractibleButtons/ParticipacaoSocial.visible = true
		5:
			jsons_lidos += 1
			var json_as_text = FileAccess.get_file_as_string("res://levels/level_2/jsons/FASE2P6.json")
			scenarios = JSON.parse_string(json_as_text)
			next_scene()
		6:
			last_scene()


func last_scene():
	end.emit()


func _on_dialogue_scene_next_button_pressed():
	next_scene()
