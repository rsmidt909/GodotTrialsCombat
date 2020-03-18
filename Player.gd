extends KinematicBody2D



var ID = "player"
var MAX_SPEED = 500
var ACCELERATION = 20000
var motion = Vector2.ZERO
var frameZero = 0
var frameSeven = 8
var frame
signal sendDamage(amount, ID)

#make attack bool for _process

#make bool for if attack and 
#var target = $RayCast2D.get_collider()
#if target != null:

#then do var x = attackDMG

#gettargetID() x - targetIDHealth


##################################################

#Create one reciever signal - recieves in a format - object
#create one emmiter signal - sends in a format - object
#--------------------------------------------------
# create attack and reciever does getbody func that sets bool if assigned playerID is in area. If so, and signal being emitted
# cause damage
#assign player ID

#/# still need to make connection to node for signal recieving


func _process(_delta):
	if Input.is_action_just_pressed("ui_select"):
		#for for now, we damage thens how attack until design for while action.
		emit_signal("sendDamage", 50, ID)
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
	# Turn RayCast2D toward movement direction
	if axis != Vector2.ZERO:
		$RayCast2D.cast_to = axis.normalized() * 8

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

func getColliderInfo():
var target = $RayCast2D.get_collider()
if target != null:
