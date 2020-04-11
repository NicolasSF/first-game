extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func get_input():
	if Input.is_action_pressed('click_tap'):
		get_tree().change_scene("res://Node2D.tscn")
 # Replace with function body.
func _process(_delta):
	get_input()
