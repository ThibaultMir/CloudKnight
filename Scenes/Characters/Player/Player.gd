extends CharacterBody2D

@onready var animated_sprite = get_node("AnimatedSprite")
var bullet = preload("res://Scenes/bullet.tscn")
var bullet_speed = 2000 

var speed = 300.0
var direction = Vector2(0, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	velocity.x = speed * direction.x
	velocity.y = speed * direction.y
	move_and_slide()

func _input(event : InputEvent):
	direction.x = int(Input.is_action_pressed("RIGHT")) - int(Input.is_action_pressed("LEFT"))
	direction.y = int(Input.is_action_pressed("DOWN")) - int(Input.is_action_pressed("UP"))
	direction = direction.normalized()
	
	match(direction):
		Vector2.RIGHT: animated_sprite.play("MoveRight")
		Vector2.LEFT: animated_sprite.play("MoveLeft")
		Vector2.DOWN: animated_sprite.play("MoveDown")
		Vector2.UP: animated_sprite.play("MoveUp")
		Vector2.ZERO:
			animated_sprite.stop()
			animated_sprite.set_frame(0)
	
	if Input.is_action_just_pressed("Click"):
		fire()

func fire():
	var b = bullet.instantiate()
	owner.add_child(b)
	b.transform = $SpawnBullet.global_transform
