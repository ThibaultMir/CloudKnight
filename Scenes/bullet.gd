extends Area2D

var speed = 500
var shot = false

func _physics_process(delta):
	if shot == false:
		look_at(get_global_mouse_position())
		shot = true
	position += transform.x * speed * delta
