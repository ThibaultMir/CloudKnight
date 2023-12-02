extends CharacterBody2D

@onready var animated_sprite = get_node("AnimatedSprite") 

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
	direction.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	direction.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	direction = direction.normalized()
	
	if (direction == Vector2.ZERO):
		animated_sprite.stop()
		animated_sprite.set_frame(0)

	match(direction):
		Vector2.RIGHT: animated_sprite.play("MoveRight")
		Vector2.LEFT: animated_sprite.play("MoveLeft")
		Vector2.DOWN: animated_sprite.play("MoveDown")
		Vector2.UP: animated_sprite.play("MoveUp")
