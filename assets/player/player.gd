extends KinematicBody2D

class_name PLAYER_MAIN

export(int) var WALKSPEED = 120
export(int) var RUNSPEED = 160
export(float) var STRAFE_MULT = 0.7
export(bool) var in_vehicle
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

func _ready():
	print("Connecting signals...")
	Game.connect("on_player_in_vehicle", self, "__on_enter_vehicle")
	Game.connect("on_player_exit_vehicle", self, "__on_exit_vehicle")
	Game.set('Player', self)
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE) 
#	current_weapon = $TestWeapon

func get_input():
	look_at(get_global_mouse_position())

	# Writing movements this way is more compact and avoids using if statements 
	direction = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)
	# Normalize movements to avoid going faster when walking diagonally
	direction = direction.normalized() * WALKSPEED
	direction = move_and_slide(direction)
	
	if Input.is_action_pressed("shoot"):
		direction = Vector2.ZERO

func _physics_process(_delta):
	if in_vehicle: return
	
	get_input()	

#	if Input.is_action_pressed("run"):
		# TODO: play run animation
#		speed = RUNSPEED
	
	#smoothed_mouse_pos = lerp(smoothed_mouse_pos, mouse_pos, 0.3)
	#look_at(smoothed_mouse_pos)
	#look_at(mouse_pos)

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
	

# primarily used during the alpha/beta phase
func teleport(pos:Vector2):
	position = pos

func __on_enter_vehicle(vehicle_camera):
	print("Entered vehicle", vehicle_camera)
	in_vehicle = true
	$Sprite.visible = false
	$PlayerCamera.current = false
	vehicle_camera.current = true
	
func __on_exit_vehicle(pos, vehicle_camera):
	print("Exited vehicle", pos, vehicle_camera)
	in_vehicle = false
	self.teleport(pos)
	$Sprite.visible = true
	$PlayerCamera.current = true
	vehicle_camera.current = false
	

