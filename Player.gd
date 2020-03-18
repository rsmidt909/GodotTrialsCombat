extends KinematicBody2D

var MAX_SPEED = 500
var ACCELERATION = 20000
var motion = Vector2.ZERO
var frameZero = 0
var frameSeven = 8
var frame


func _process(_delta):
	if Input.is_action_just_pressed("ui_select"):
		$AnimatedSprite.play("Attack")
		if $AnimatedSprite.get_frame() == frameSeven:
				$AnimatedSprite.set_frame(frameZero)


func _physics_process(delta):
	var axis = get_input_axis()
	if axis == Vector2.ZERO:
		apply_friction(ACCELERATION * delta)
	else:
		apply_movement(axis * ACCELERATION * delta)
	motion = move_and_slide(motion)

func get_input_axis():
	var axis = Vector2.ZERO
	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	axis.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	return axis.normalized()
	
func apply_friction(amount):
	if motion.length() > amount:
		motion -= motion.normalized() * amount
	else:
			motion = Vector2.ZERO

func apply_movement(acceleration):
	motion =+ acceleration
	if motion.length()>MAX_SPEED:
		motion = motion.clamped(MAX_SPEED)


