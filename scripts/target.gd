extends Node2D

var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	$AnimatedSprite2D.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x = get_viewport().get_mouse_position().x
	position.y = get_viewport().get_mouse_position().y
	position = position.clamp(Vector2.ZERO, screen_size)
