extends Area2D

@onready var angel = get_node("../Angel")
var target
var direction
var speed
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play()
	add_to_group("attack_demons")
	screen_size = get_viewport_rect().size
	starting_pos()
	target = angel.position
	direction = (target - position).normalized()
	if (direction.x < 0): $AnimatedSprite2D.flip_h = true
	speed = 400

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += speed * direction * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func starting_pos():
	var x = randi_range(0, screen_size.x)
	var y = randi_range(0, 0.8 * screen_size.y)
	var side = randi_range(0, 2)
	if (side == 0):
		x = 0
	elif (side == 1):
		y = 0
	elif (side == 2):
		x = screen_size.x
	position.x = x
	position.y = y
