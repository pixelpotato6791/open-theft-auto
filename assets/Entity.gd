extends Node2D

enum ENTITY_TYPE {
	CALM_PED,
	AGGRESSIVE_PED,
	ENEMY
}

enum ENTITY_STATE {
	CALM,
	RUN,
	ENGAGE,
	DEAD
}

export(int)  var eyesight
 
export(PackedScene)  var current_weapon
export(ENTITY_TYPE)  var e_type #entity_type 
export(ENTITY_STATE) var current_state

func _process(_delta):
	if current_state == ENTITY_STATE.DEAD: 
		pass
	
	var player_pos = self.get_player_pos()
	
	# TODO: use this method?
	if global_position.distance_to(player_pos) < eyesight:
		pass
		# if obstruction: pass
			# maybe try shoot a raycast to the player position?
		
		#print('In eyesight: ', global_position.distance_to(player_pos))
		
	#if not self.attacking: pass

func _on_Attacked_by_player():
	if current_state == ENTITY_STATE.DEAD: pass
	
	if e_type == ENTITY_TYPE.ENEMY or e_type == ENTITY_TYPE.AGGRESSIVE_PED:
		if current_state != ENTITY_STATE.ENGAGE:
			current_state = ENTITY_STATE.ENGAGE

func _on_Health_health_changed(old_value, new_value):
	if new_value <= 0:
		current_state = ENTITY_STATE.DEAD
		print('current state is dead')
		
	print("Health:", new_value)

func get_player_pos() -> Vector2:
	return Game.player.global_position
