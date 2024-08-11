extends CharacterBody2D

@export var speed = 75.0
@export var jump_velocity = -300.0
@export var rotation_rate = PI

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	apply_gravity(delta)
	handle_jump()
	
	var input_axis = Input.get_axis("ui_left", "ui_right")
	handle_movement(input_axis, delta)
	move_and_slide()

func apply_gravity(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

func handle_jump():
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity
	
func handle_movement(input_axis, delta):
	if input_axis:
		velocity.x = input_axis * speed
		rotation += rotation_rate * delta * input_axis
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
