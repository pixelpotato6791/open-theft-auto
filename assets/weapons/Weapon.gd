extends Node2D


class_name Weapon

#export(PackedScene) var Bullet = preload("res://assets/weapons/Bullet.tscn")
export(int)   		var damage
export(int)   		var maxammo
export(float) 		var distance

onready var muzzle = $Muzzle
onready var rcast:RayCast2D = $RayCast2D

func _ready():
	rcast.set_cast_to(Vector2(0, distance))

func shoot():
	if rcast.is_colliding():
		var collider = rcast.get_collider()
		collider.take_damage(damage)

#func shoot():
	#var bullet = Bullet.instance()
	#var target = get_global_mouse_position()
	
	#var direction = bullet.global_position.direction_to(target).normalised()
	
	#bullet.set_as_toplevel(true)
	#bullet.set_direction(direction)
	#bullet.look_at(direction)
	#end_of_gun.add_child(bullet)
	#bullet.global_position = end_of_gun.global_position
	#print(bullet.global_position)
	#print(end_of_gun.global_position)
	

	
