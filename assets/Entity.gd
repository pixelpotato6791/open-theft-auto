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
 
export(PackedScene)  var weapon
export(ENTITY_TYPE)  var e_type  #entity_type 

onready var pos = $Position2D 
onready var eyerange = $Eyesight

func set_state(new_state:int):
	if new_state == self.e_state:
		return
		
	self.e_state = new_state
	emit_signal('state_changed', self.e_state)

func _ready():
	self.pos = $Position2D	

func _physics_process(_delta):
	#print(Game.distance_to_player(self.pos))
	#if Game.distance_to_player(self.pos) < eyesight:
	#	self.on_in_eyesight()
		
	
	if not self.attacking: pass


func take_damage(x:int):
	#if self.e_type == ENTITY_TYPE.AGGRESSIVE_PED and not self.attacking:
	#	self.attacking = true
		
	if self.health > 0:
		self.health -= x
		print("Health:", self.health)
		return
		
	self.alive = false
