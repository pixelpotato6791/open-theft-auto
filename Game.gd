extends Node2D

export(PackedScene) var player

export(String) var PLAYER_GROUP_TAG = "Player"

func distance_to_player(org_obj:Position2D):
	return int(org_obj.position.distance_to(player.global_position))
