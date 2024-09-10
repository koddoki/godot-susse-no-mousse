extends CharacterBody2D

const SPEED = 300.0
var idle = 0

@onready var animation : AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	var direction = Vector2(Input.get_axis("left", "right"),Input.get_axis("up", "down"))
	
	if direction:
		velocity = direction.normalized() * SPEED
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)
	
	if direction.y > 0:
		idle = 0
		animation.play("walk_front")
	elif direction.y < 0:
		idle = 1
		animation.play("walk_back")
	elif direction.x < 0:
		idle = 2
		animation.play("walk_left")
	elif direction.x > 0:
		idle = 3
		animation.play("walk_right")
	else:
		match idle:
			0:
				animation.play("idle_front")
			1:
				animation.play("idle_back")
			2:
				animation.play("idle_left")
			3:
				animation.play("idle_right")
			
	
	move_and_slide()
