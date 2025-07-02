extends RigidBody2D

var limit
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	limit = screen_size * 0.9529


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = position.clamp(Vector2.ZERO, limit)
