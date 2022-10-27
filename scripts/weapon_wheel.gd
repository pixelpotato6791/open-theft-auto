extends Node2D

enum WEAPONS {
	FISTS,
	FLIP, # not a weapon, but still 
	BASEBALL_BAT,
	SHOTGUN,
	SMG,
	AR
}

var current_weapon:int = WEAPONS.FISTS

signal on_weapon_change (weapon_id)

func set_current_weapon(id):
	if id >= 6:
		id = 0
	elif id < 0:
		id = 5
		
	current_weapon = id
	emit_signal("on_weapon_change", current_weapon)

func _process(_delta):
	if Input.is_action_just_released("next_weapon"):
		print("test")
		set_current_weapon(current_weapon + 1)
	elif Input.is_action_just_released("back_weapon"):
		set_current_weapon(current_weapon - 1)
	elif Input.is_action_just_pressed("weapon_1"):
		set_current_weapon(WEAPONS.FISTS) # 0
	elif Input.is_action_just_pressed("weapon_2"):
		set_current_weapon(WEAPONS.FLIP) # 1
	elif Input.is_action_just_pressed("weapon_3"):
		set_current_weapon(WEAPONS.BASEBALL_BAT) # 2
	elif Input.is_action_just_pressed("weapon_4"):
		set_current_weapon(WEAPONS.SHOTGUN) # 3
	elif Input.is_action_just_pressed("weapon_5"):
		set_current_weapon(WEAPONS.SMG) # 4
	elif Input.is_action_just_pressed("weapon_6"):
		set_current_weapon(WEAPONS.AR) # 5

