extends Node2D

export(int) var health

signal health_changed(old_value, new_value)

func take_damage(x:int):
	var old_health = health
	health -= x
	emit_signal("health_changed", old_health, health)
	
