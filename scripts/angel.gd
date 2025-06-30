extends Area2D

signal hit

@export var speed = 400
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	$AnimatedSprite2D.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move(delta)

func _on_body_entered(body):
	hide() # Player disappears after being hit.
	hit.emit()
	# Must be deferred as we can't change physics properties on a physics callback.
	$CollisionShape2D.set_deferred("disabled", true)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

func move(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("Move right"):
		$AnimatedSprite2D.flip_h = false
		velocity.x += 1
	if Input.is_action_pressed("Mode left"):
		$AnimatedSprite2D.flip_h = true
		velocity.x -= 1
	if Input.is_action_pressed("Move down"):
		velocity.y += 1
	if Input.is_action_pressed("Move up"):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
