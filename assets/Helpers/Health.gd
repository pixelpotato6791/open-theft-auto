extends Node

export(int) var health = 100


func take_damage(x:int) -> bool:
	if self.health > 0:
		self.health -= x
		return true
		
	return false
