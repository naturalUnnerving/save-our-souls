extends Node

var arrow = preload("res://Scenes/arrow.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	fire()

func fire():
	if (Input.is_action_just_pressed("Fire") and get_tree().get_nodes_in_group("Arrows").size() <= 3):
		var shotInstance = arrow.instantiate()
		add_child(shotInstance)
