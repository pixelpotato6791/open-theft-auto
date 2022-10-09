extends Area2D


enum State {
	CALM,
	ENGAGE,
	DEAD
}



signal ai_state_changed(new_state)

export(int) var SPEED 
var current_state:int = State.CALM 

func _ready():
	emit_signal("ai_state_changed", self.current_state)

func set_state(state:int):
	if current_state == state:
		return
	
	current_state = state
	emit_signal("ai_state_changed", current_state)
	
func _process(_delta):
	match self.current_state:
		State.DEAD:
			pass
		State.CALM:
			pass
		State.ENGAGE:
			var player_pos = Game.player.global_position

			# need to re-evaluate this
			get_parent().look_at(player_pos)
			get_parent().move_and_slide(global_position.direction_to(player_pos) * SPEED)
			####

func _on_Eyesight_body_entered(body):
	print('entered')
	if body.is_in_group(Game.PLAYER_GROUP_TAG):
		print('player in group')
		#emit_signal("state_changed", State.ENGAGE)
		set_state(State.ENGAGE)


func _on_Eyesight_body_exited(body):
	if body.is_in_group(Game.PLAYER_GROUP_TAG):
		set_state(State.CALM)
