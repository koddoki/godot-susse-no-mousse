extends Marker2D


var words : Array


func _physics_process(delta):
	if !words.is_empty():
		for word in words:
			if word is Node2D:
				word.position = word.position.move_toward(position, delta * 20)
				if word.position == position:
					word.queue_free()
					words.erase(word)
					break


func add_to_words(word : Node2D):
	words.append(word)
