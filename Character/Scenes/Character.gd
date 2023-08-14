extends KinematicBody2D
export var acceleration = 800
export var maxspeed = 24
export var friction = 1000
var velocity = Vector2.ZERO
export var animation = false

func _ready():
	pass

func _physics_process(delta):
	if animation == false:
		var input_vector = Vector2.ZERO
		input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		input_vector = input_vector.normalized()
		if input_vector != Vector2.ZERO:
			velocity = velocity.move_toward(input_vector * maxspeed, acceleration * delta)
		else:
			velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
		move_and_slide(velocity)
