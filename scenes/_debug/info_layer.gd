extends CanvasLayer

@onready var velocity = $InfoBox/Velocity
@onready var player = $"../Player"

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity.text = "Velocity: Not set."
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity.text = "Velocity: %s" % str(player.velocity)
