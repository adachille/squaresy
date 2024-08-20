extends RigidBody2D

@export var jump_strength = -300
@export var rotation_rate = PI*2
@export var slide_speed = 10000.0

@onready var collision_polygon_2d = $CollisionPolygon2D

var on_floor : bool = false
var in_air : bool = false

func _physics_process(delta):
	handle_jump()
	
	var input_axis = Input.get_axis("ui_left", "ui_right")
	handle_movement(input_axis, delta)

func handle_jump() -> void:
	if Input.is_action_just_pressed("ui_accept"):
		if on_floor:
			apply_impulse(Vector2(0, jump_strength))
		#

func handle_movement(input_axis: int, delta: float) -> void:
	if input_axis:
		if on_floor:
			apply_force(Vector2(input_axis * slide_speed * delta, 0))
		angular_velocity = rotation_rate * input_axis
		

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	var num_contacts = state.get_contact_count()
	in_air = num_contacts > 0
	
	on_floor = false
	for i in range(num_contacts):
		var normal := state.get_contact_local_normal(i)
		if normal.dot(Vector2.UP) > 0.25:
			on_floor = true
			#  1.0 would be perfectly straight up
			#  0.0 is a wall
			# -1.0 is a ceiling
