extends Node2D

@onready var base : Sprite2D = $BaseSeringa
@onready var corpo : Sprite2D = $CorpoSeringa
@onready var progressBar : ProgressBar = $ProgressBar
@onready var bar : ColorRect = $ColorRect


func _process(delta):
	global_position = Vector2(get_global_mouse_position().x - 110, get_global_mouse_position().y)
	if Input.is_action_pressed("click"):
		var lerpVal = base.global_position.move_toward(Vector2(corpo.global_position.x-50,base.global_position.y),100*delta)
		base.global_position = lerpVal
		bar.global_position.x -= bar.global_position.x -lerpVal.x - 29
		progressBar.value = corpo.global_position.x - lerpVal.x + 29
		print(corpo.global_position.x - lerpVal.x)
		
