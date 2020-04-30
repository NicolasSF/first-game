extends KinematicBody2D

export (int) var speed = 200

# Movement variables
const ACCELERATION = 500
const MAX_SPEED = 200
const FRICTION = 400

var velocity = Vector2.ZERO

# 
signal hit

# Declare member variables here. Examples:
var level = 58
const health = 100
const max_health = 100
const regen = 1
#la vida aumenta con cada nivel, se regenera con el tiempo
var xp = 23
const xp_needed = 100
const damage = 1
var armor = 2

func hud_update():	
	for label in $HUD/ColorRect.get_children():
		if label.get("current_info_for"):
			if label.current_info_for == "level":
				label.text = String(level)	
			elif label.current_info_for == "xp":
				label.text = String(xp)
			elif label.current_info_for == "armor":
				label.text = String(armor)


func get_input(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity  = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	

func _physics_process(delta):
	get_input(delta)
	velocity = move_and_slide(velocity)
	
	hud_update()
