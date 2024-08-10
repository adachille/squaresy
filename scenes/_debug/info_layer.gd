extends CanvasLayer

@onready var player_velocity = $InfoBox/Velocity
@onready var player_rotation = $InfoBox/Rotation
@onready var player = $"../Player"

# Called when the node enters the scene tree for the first time.
func _ready():
	player_velocity.text = "Velocity: Not set."
	player_rotation.text = "Rotation: Not set."
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	player_velocity.text = "Velocity: %s" % str(player.velocity)
	
	var rotation_degrees = round(rad_to_deg(player.rotation))
	player_rotation.text = "Rotation: %s" % str(rotation_degrees)
