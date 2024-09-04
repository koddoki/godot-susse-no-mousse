extends Node2D

func _ready():
	var file = "res://levels/interactive_levels/level_1/json/saude_publica.json"
	var json_as_text = FileAccess.get_file_as_string(file)
	var json_as_dict = JSON.parse_string(json_as_text)
	if json_as_dict:
		for batata in json_as_dict:
			if batata.has("background") and batata["background"] != null:
				print("existe")
			else:
				print("nao existe")
