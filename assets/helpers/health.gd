extends Node2D

export(int) var health = 100

signal health_changed(old_value, new_value)

func take_damage(x:int):
	if health <= 0: return

	var old_health = health
	health -= x
	emit_signal("health_changed", old_health, health)
	
