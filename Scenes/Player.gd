extends Area2D


@export var speed = 400
@export var shotscene = preload("res://Scenes/Bullet.tscn")
@export var shotspeed = 1000.0

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(get_global_mouse_position())
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("main_shoot"):
		fire()
	if velocity.length() > 0:
			velocity = velocity.normalized() * speed 
	position += velocity * delta

func fire():
	 var shot = shotscene.instance()
	 var shotvect = (get_node("shotpoint").get_global_pos() - get_global_pos()).normalized()
	 get_parent.add_child(shot)
	 shot.set_global_pos(get_node("shotpoint").get_global_pos())
	 shot.set_linear_velocity(shotvect * shotspeed) # if your shot is a rigidbody
