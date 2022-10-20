extends Node2D

export(PackedScene) var player

export(String) var PLAYER_GROUP_TAG = "Player"

signal on_player_in_vehicle (vehicle_camera)
signal on_player_exit_vehicle (new_pos, vehicle_camera)

# might need to remove this since the org_obj might not be a Position2D
# cant always use the same code so might need a switch case for the type
# of org_obj. Am i making sense? oh well life goes on ay
func distance_to_player(org_obj:Position2D):
	return int(org_obj.position.distance_to(player.global_position))
