extends Level


@onready var dialogue_scene := $DialogueScene


var dialogues : Array


func _ready():
	var json_as_text = FileAccess.get_file_as_string("res://levels/level_4/jsons/FASE4P1.json")
	dialogue_scene.visible = true
	dialogues = JSON.parse_string(json_as_text)
	next_scene()


func next_scene():
	if dialogues.size() > 0:
		var dialogue = dialogues.pop_back()
		var background = dialogue["background"] if dialogue.has("background") else null
		var title = dialogue["title"] if dialogue.has("title") else null
		var text = dialogue["text"] if dialogue.has("text") else null
		var character_data = dialogue["character_data"] if dialogue.has("character_data") else null
		dialogue_scene.update_text(title, text)
		dialogue_scene.update_characters(character_data)
		dialogue_scene.update_background(background)
		return
	
	emit_signal("end")


func _on_dialogue_scene_next_button_pressed():
	next_scene()
