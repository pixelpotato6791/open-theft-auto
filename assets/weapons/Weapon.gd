extends Node2D


class_name Weapon

export(PackedScene) var Bullet
export(int)   		var damage
export(bool)  		var ismelee
export(int)   		var maxammo
export(float) 		var distance

func _ready():
	Bullet = preload("res://assets/weapons/Bullet.tscn")

func shoot():
	if ismelee:
		pass
		
	var bullet_instance = Bullet.instance()
		
	
