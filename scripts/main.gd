extends Node

var arrow = preload("res://Scenes/arrow.tscn")
var demon_attack = preload("res://Scenes/demon_attack.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ($Angel.is_visible_in_tree()):
		fire()

func fire():
	if (Input.is_action_just_pressed("Fire") and get_tree().get_nodes_in_group("Arrows").size() <= 3):
		var shotInstance = arrow.instantiate()
		add_child(shotInstance)

func _on_attack_demon_timer_timeout():
	var newDemon = demon_attack.instantiate()
	add_child(newDemon)
