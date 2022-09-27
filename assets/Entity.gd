extends Node

export(int)  var health
export(bool) var status
export(bool) var dead

func take_damage(x:int):
	if self.health > 0:
		self.health -= x
		print("Health:", self.health)
