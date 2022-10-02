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

onready var pos = $Position2D 

func _process(_delta):
	var player_pos = self.get_player_pos()
	
	# TODO: use this method?
	if global_position.distance_to(player_pos) < eyesight:
		
		# if obstruction: pass
			# maybe try shoot a raycast to the player position?
		
		print('In eyesight:', global_position.distance_to(player_pos))
		
	#if not self.attacking: pass

func _on_Attacked_by_player():
	if self.e_type == ENTITY_TYPE.ENEMY or self.e_type == ENTITY_TYPE.AGGRESSIVE_PED:
		if self.current_state != ENTITY_STATE.ENGAGE:
			self.current_state = ENTITY_STATE.ENGAGE

func _on_Health_health_changed(old_value, new_value):
	if new_value <= 0:
		self.alive = false
		
	print("Health:", new_value)

func get_player_pos() -> Vector2:
	return Game.player.global_position
