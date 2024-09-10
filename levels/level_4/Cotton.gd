extends Sprite2D


func _process(delta):
	global_position = Vector2(get_global_mouse_position().x, get_global_mouse_position().y)
	if Input.is_action_pressed("click"):
		global_position = Vector2(get_global_mouse_position().x, get_global_mouse_position().y)
