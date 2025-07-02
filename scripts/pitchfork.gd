extends Area2D

@onready var angel = get_node("../Angel")
var direction
var speed
var velocity

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play()
	var demon = get_tree().get_nodes_in_group("attack_demons")[1]
	position = demon.position
	var target = angel.position
	direction = (target - position).normalized()
	speed = 400
	velocity = speed * direction
	global_rotation = direction.angle()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += velocity * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_area_entered(area):
	if (area.is_in_group("Angel")):
		queue_free()
