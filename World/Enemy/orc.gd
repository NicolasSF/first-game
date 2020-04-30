extends KinematicBody2D

var player #player node
var rng = RandomNumberGenerator.new()
export var speed = 100
var direction : Vector2
#var last_direction = Vector2(0, 1)
var bounce_countdown = 0 #how much time the orc will flee after collision


# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()


func _on_Timer_timeout():
	# Calculate the position of the player relative to the skeleton
	player = get_node("../Player")
	var player_relative_position = player.position - position

	if player_relative_position.length() <= 20:
		# If player is near, don't move but turn toward it
		direction = Vector2.ZERO
#		last_direction = player_relative_position.normalized()
	elif player_relative_position.length() <= 200 and bounce_countdown == 0:
		# If player is within range, move towards it
		direction = player_relative_position.normalized()
	elif bounce_countdown == 0:
		# If player is too far, randomly decide whether to stand still or where to move
		var random_number = rng.randf()
		if random_number < 0.05:
			direction = Vector2.ZERO
		elif random_number < 0.1:
			direction = Vector2.DOWN.rotated(rng.randf() * 2 * PI)
	
	# Update bounce countdown
	if bounce_countdown > 0:
		bounce_countdown = bounce_countdown - 1

func _physics_process(delta):
	var movement = direction * speed * delta
	
	var collision = move_and_collide(movement)

	if collision != null: 
		
		var type = str(collision.collider)
		
		print("is player or orc: " + collision.collider.name)
		if collision.collider.name.find("Player", 0) != -1 or collision.collider.name.find("orc", 0) != -1:
			_bounce_time([3,5])
		elif type.find("StaticBody", 0) != -1:
			print("type: " + type)
			_bounce_time([1,3])

func _bounce_time(rango):
	direction = direction.rotated(rng.randf_range(PI/4, PI/2))
	bounce_countdown = rng.randi_range(rango[0], rango[1])
