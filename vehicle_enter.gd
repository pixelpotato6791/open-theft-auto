extends KinematicBody2D

#
#
# https://www.youtube.com/watch?v=mJ1ZfGDTMCY
#
#

var direction
export(int) var engine_power = 250

# exports for debugging 
export(bool) var player_in_vehicle
export(bool) var npc_in_vehicle
export(bool) var player_in_range

func _process(_delta):
	if Input.is_action_just_pressed("enter_vehicle"):
		if player_in_vehicle:
			Game.emit_signal("on_player_exit_vehicle", get_driver_door_pos(), $VehicleCamera)	
			player_in_vehicle = false
			
		elif player_in_range:
			player_in_vehicle = true
			print("set player_in_vehicle")
			Game.emit_signal("on_player_in_vehicle", $VehicleCamera)
		
		
	if player_in_vehicle:
		pass
	
	#if Input.is_action_just_pressed("enter_vehicle"):
	#	if player_in_vehicle:
	#		Game.emit_signal("on_player_exit_vehicle", get_driver_door_pos(), $VehicleCamera)

func _physics_process(delta):
	if not player_in_vehicle: return
	
	look_at(get_global_mouse_position())
	
	direction = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)
	
	direction = direction.normalized() * engine_power
	direction = move_and_slide(direction)
	
func on_npc_entered_vehicle():
	return

func _on_Area2D_body_entered(body):
	print("Body entered")
	
	if body.is_in_group(Game.PLAYER_GROUP_TAG):
		print("Player in range true")
		player_in_range = true


func _on_Area2D_body_exited(body):
	pass


func get_driver_door_pos():
	return $DriverDoor.position
