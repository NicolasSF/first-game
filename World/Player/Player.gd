extends Area2D
signal hit

# Declare member variables here. Examples:
export var level = 58
const health = 100
const max_health = 100
const regen = 1
#la vida aumenta con cada nivel, se regenera con el tiempo
export var xp = 23
const xp_needed = 100
const damage = 1
export var armor = 2

func process(_delta):	
	for label in $HUD/ColorRect.get_children():
		if label.get("current_info_for"):
			if label.current_info_for == "level":
				label.text = String(level)	
			elif label.current_info_for == "xp":
				label.text = String(xp)
			elif label.current_info_for == "armor":
				label.text = String(armor)

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
