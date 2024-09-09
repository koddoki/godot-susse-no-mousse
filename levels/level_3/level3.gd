extends Level


@onready var dialogue_scene := $DialogueScene
@onready var background := $Background

var json_count = 1
var scenarios : Array


func _ready():
	var json_as_text = FileAccess.get_file_as_string("res://levels/level_3/jsons/FASE3P1.json")
	dialogue_scene.visible = true
	scenarios = JSON.parse_string(json_as_text)
	next_scene()


func next_scene():
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
	match json_count:
		1:
			var json_as_text = FileAccess.get_file_as_string("res://levels/level_3/jsons/FASE3P2.json")
			scenarios = JSON.parse_string(json_as_text)
			json_count += 1
			
			dialogue_scene.visible = true
			next_scene()
		2:
			pass
	
	emit_signal("end")


func _on_dialogue_scene_next_button_pressed():
	next_scene()
