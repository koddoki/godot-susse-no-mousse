@tool


extends Node2D

@export var texture_path := "res://assets/Levels/Level2/const4.jpg"
@export var destino : = Marker2D
@export var texture_size : Vector2

# Variáveis do dialogo
@export_file("*.json") var dialogue_json


@onready var button : = $Button
@onready var word_texture := $TextureRect


var corre : = false

signal clicado(dialogue_json)


func _ready():
	word_texture.texture = load(texture_path)
	word_texture.size = texture_size
	button.size = word_texture.size
	word_texture.position.x = -int(texture_size.x/2)
	word_texture.position.y = -int(texture_size.y/2)
	button.position.x = -int(texture_size.x/2)
	button.position.y = -int(texture_size.y/2)
	


func _process(delta) -> void:
	if Engine.is_editor_hint():
		word_texture.texture = load(texture_path)
		word_texture.size = texture_size
		button.size = texture_size
		word_texture.position.x = -int(texture_size.x/2)
		word_texture.position.y = -int(texture_size.y/2)
		button.position.x = -int(texture_size.x/2)
		button.position.y = -int(texture_size.y/2)

## Updates multiple characters based on the provided data.
##
## @param characters_data Array of tuples, where each tuple contains:
##   - Texture2D: The texture for the character.
##   - int: The row position. Min value = 1; Max value = 4; Default value = 1.
##   - int: The column position. Min value = 1; Max value = 6; Default value = 1.
##   - bool: Whether the character is flipped horizontally.
## - character_texture : Texture2D, row : int, column : int, is_fipped : bool
func _physics_process(delta):
	if !Engine.is_editor_hint() and corre:
		position = position.move_toward(destino.position, delta * 500)
		if position == destino.position:
			emit_signal("clicado", dialogue_json)
			queue_free()


func _on_button_pressed():
	corre = true
	
