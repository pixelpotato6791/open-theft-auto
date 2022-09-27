extends Area2D

# THIS SCRIPT IS NO LONGER IN USE
# CHANGED TO HITSCAN SYSTEM INSTEAD

export(int) var speed = 300

var direction := Vector2.ZERO

func _ready():
	print("Spawned new bullet!")

func _physics_process(_delta: float) -> void:
	if direction != Vector2.ZERO:
		var velocity = direction * speed
		
		global_position += velocity
		
func set_direction(_direction: Vector2):
	self.direction = _direction
