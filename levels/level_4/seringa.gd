extends Node2D

@onready var base : Sprite2D = $BaseSeringa
@onready var corpo : Sprite2D = $CorpoSeringa
@onready var progressBar : ProgressBar = $ProgressBar
@onready var bar : ColorRect = $ColorRect

var segurando = false

signal terminou


func _process(delta):
	global_position = Vector2(get_global_mouse_position().x - 110, get_global_mouse_position().y)
	
	if segurando:
		var lerpVal = base.global_position.move_toward(Vector2(corpo.global_position.x-50,base.global_position.y),1)
		base.global_position = lerpVal
		bar.global_position.x -= bar.global_position.x -lerpVal.x - 29
		progressBar.value = corpo.global_position.x - lerpVal.x + 29
		
		if progressBar.value >= 79:
			terminou.emit()





func _on_blood_button_button_down():
	segurando = true


func _on_blood_button_button_up():
	segurando = false
