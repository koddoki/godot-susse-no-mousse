extends Button

var dragging : bool = false
var max_velocity : Vector2 = Vector2(800,800)


func _ready():
	mouse_entered.connect(_on_area_2d_mouse_entered)
	mouse_exited.connect(_on_area_2d_mouse_exited)
	
	button_down.connect(_on_button_down)
	button_up.connect(_on_button_up)


func _process(delta):
	if dragging:
		get_parent().rotation = 0
		get_parent().global_position = get_global_mouse_position()
		get_parent().linear_velocity = Input.get_last_mouse_velocity()#.clamp(-max_velocity,max_velocity)
	


func _on_area_2d_mouse_entered():
	get_parent().get_node("Sprite2D").scale *= 1.05


func _on_area_2d_mouse_exited():
	get_parent().get_node("Sprite2D").scale /= 1.05


func _on_button_down():
	dragging = true


func _on_button_up():
	dragging = false
