extends Area2D

@onready var Target = get_node("../Target")
@onready var angel = get_node("../Angel")
var direction
var speed
var velocity
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Arrows")
	$AnimatedSprite2D.play()
	screen_size = get_viewport_rect().size
	position = angel.position
	var target = Target.position
	direction = (target - position).normalized()
	speed = 400
	velocity = speed * direction
	rotation = direction.angle()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += velocity * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_area_entered(area):
	if (area.is_in_group("attack_demons")):
		area.queue_free()
		queue_free()
