extends CanvasLayer

@onready var player_velocity = $InfoBox/Velocity
@onready var player_rotation = $InfoBox/Rotation
#@onready var player = $"../Player"
@onready var player = $"../RigidBodyPlayer"

func _ready():
	player_velocity.text = "Velocity: Not set."
	player_rotation.text = "Rotation: Not set."
	pass


func _process(_delta):
	#player_velocity.text = "Velocity: %s" % str(player.velocity)
	player_velocity.text = "Velocity: %s" % str(player.linear_velocity)
	
	var rotation_degrees = round(rad_to_deg(player.rotation))
	player_rotation.text = "Rotation: %s" % str(rotation_degrees)
