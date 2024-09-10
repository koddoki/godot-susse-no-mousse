extends Level


@onready var dialogue_scene := $DialogueScene
@onready var background := $Background
@onready var animation := $AnimationPlayer

var json_count = 1
var scenarios : Array


func _ready():
	var json_as_text = FileAccess.get_file_as_string("res://levels/level_4/jsons/FASE4P1.json")
	dialogue_scene.visible = true
	scenarios = JSON.parse_string(json_as_text)
	next_scene()


func next_scene():
	print(scenarios.size())
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
	match json_count:
		1:
			var json_as_text = FileAccess.get_file_as_string("res://levels/level_4/jsons/FASE4P2.json")
			scenarios = JSON.parse_string(json_as_text)
			json_count += 1
			
			$Syringe.visible = true
			$BloodButton.visible = true
			$BraçoSangue.visible = true
			dialogue_scene.visible = false
			
			return
		2:
			end.emit()
			return
	print("Erro fudeu")
	emit_signal("end")


func _on_dialogue_scene_next_button_pressed():
	next_scene()


func _on_blood_button_pressed():
	$BloodButton.queue_free()
	$Syringe.queue_free()
	$Cotton.visible = true
	$CottonButton.visible = true


func _on_cotton_button_pressed():
	$CottonButton.queue_free()
	$Cotton.queue_free()
	$BraçoSangue.queue_free()
	dialogue_scene.visible = true
	
	next_scene()


func _on_blood_button_button_down():
	pass # Replace with function body.
