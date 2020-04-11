extends Area2D
signal hit

# Declare member variables here. Examples:
const level = 1
const health = 100
const max_health = 100
const regen = 1
#la vida aumenta con cada nivel, se regenera con el tiempo
const xp = 0
const xp_needed = 100
const damage = 1
const armor = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D__Player_body_entered(body):
	pass # Replace with function body.

#func enemy_killed(int):
#	xp = xp + (reward * monster_level)
#
#if xp > xp_needed
#	level = level + 1
#	damage = damage + 1
#	health = health + 10
#elseif xp =
#
#
#
#
