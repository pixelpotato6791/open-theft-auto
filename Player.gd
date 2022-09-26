extends KinematicBody2D

export(int) var WALKSPEED = 80
export(int) var RUNSPEED = 160
var smoothed_mouse_pos: Vector2 
var move_pos: Vector2

class PlayerStats:
	# player info
	var player_name:String
	var age:int
	var health:int
	var armor:int
	var missions_completed:Array
	
	# inventory
	var weapon_1:int
	var weapon_2:int
	
	# general stats
	var kills:int
	var missions_completed_count:int
	

func _ready():
	#Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED) 
	pass


func _physics_process(_delta):
	var mouse_pos = get_global_mouse_position()
	var speed = WALKSPEED
	
	if Input.is_action_pressed("run"):
		speed = RUNSPEED
	
	smoothed_mouse_pos = lerp(Vector2.ZERO, mouse_pos, 0.3)
	look_at(smoothed_mouse_pos)
	#look_at(mouse_pos)
	
	if Input.is_action_pressed("foward"):
		move_pos = global_position.direction_to(mouse_pos) * speed
		if global_position.distance_to(mouse_pos) > 5:
			move_pos = move_and_slide(move_pos)
