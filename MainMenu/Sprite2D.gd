extends Sprite2D


@onready var rng = RandomNumberGenerator.new()
@onready var starting_position : = position
@export var distance : = 10
@export var speed : = 8

@onready var next_position : = generate_rng()


func _process(delta) -> void:
	if position == next_position:
		next_position = generate_rng()
	position = position.move_toward(next_position, delta * speed)


func generate_rng() -> Vector2 :
	return Vector2(rng.randf_range(starting_position.x - distance, starting_position.x + distance), rng.randf_range(starting_position.y - distance, starting_position.y + distance))
