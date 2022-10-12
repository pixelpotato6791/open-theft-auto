extends KinematicBody2D

class_name PLAYER_MAIN

export(int) var WALKSPEED = 120
export(int) var RUNSPEED = 160
export(float) var STRAFE_MULT = 0.7
#var smoothed_mouse_pos: Vector2 
#var move_pos: Vector2

var friction = 0.3
var direction = Vector2()
var rotation_dir = 0

# player info
var player_name:String
var age:int
var health:int
var armor:bool
var missions_completed:Array

# inventory
#var current_weapon:Weapon

# general stats
var kills:int
var missions_completed_count:int


func get_input():
	look_at(get_global_mouse_position())

	direction = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)
	direction = direction.normalized() * WALKSPEED
	
	if Input.is_action_pressed("shoot"):
		direction = Vector2.ZERO

func _ready():
	Game.set('Player', self)
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED) 
#	current_weapon = $TestWeapon
	pass

func _physics_process(_delta):
#	var mouse_pos = get_global_mouse_position()
#	var speed = WALKSPEED
	
#	if Input.is_action_pressed("run"):
		# TODO: play run animation
#		speed = RUNSPEED
	
	#smoothed_mouse_pos = lerp(smoothed_mouse_pos, mouse_pos, 0.3)
	#look_at(smoothed_mouse_pos)
	#look_at(mouse_pos)

	get_input()	
	#rotation += rotation_dir * _delta
	direction = move_and_slide(direction.rotated(rotation_dir))
	
#	if Input.is_action_pressed("forward"):
#		move_pos = global_position.direction_to(mouse_pos) * speed
#		if global_position.distance_to(mouse_pos) > 5:
#			move_pos = move_and_slide(move_pos)
#			print(move_pos)
	
#	if Input.is_action_pressed("backwards"):
#		move_pos = -global_position.direction_to(mouse_pos) * WALKSPEED
#		move_pos = move_and_slide(move_pos)
	
#	if Input.is_action_pressed("shoot"):
#		if current_weapon:
#			current_weapon.shoot()

	# Animations
	if  direction != Vector2(0, 0):
		$AnimationPlayer.play("Walk")
	elif Input.is_action_pressed("shoot"):
		$AnimationPlayer.play("Pistol")
	else:
		$AnimationPlayer.play("Idle")

#func on_weapon_pickup(wpn:Weapon):
#	if self.current_weapon.w_name == wpn.w_name:
#		wpn.get_ammo()
#		return
		
#	self.current_weapon.drop()
#	self.current_weapon = wpn
	

func teleport(pos:Vector2):
	pass


