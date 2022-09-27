extends Node2D

enum ENTITY_TYPE {
	CALM_PED,
	AGGRESSIVE_PED,
	ENEMY
}


export(int)  var health
export(bool) var alive
export(bool) var attacking
export(int)  var eyesight
 
export(PackedScene) var weapon
export(ENTITY_TYPE) var e_type #entity_type 

onready var pos = $Position2D 

func _ready():
	self.pos = $Position2D	

func _physics_process(_delta):
	if self.pos.global_position.distance_to(self.get_player_pos()) < eyesight:
		print(global_position.distance_to(self.get_player_pos()))
		print('In eyesight')
		
	if not self.attacking: pass

func take_damage(x:int):
	#if self.e_type == ENTITY_TYPE.AGGRESSIVE_PED and not self.attacking:
	#	self.attacking = true
		
	if self.health > 0:
		self.health -= x
		print("Health:", self.health)
		return
		
	self.alive = false

func get_player_pos() -> Vector2:
	return Game.player.global_position
