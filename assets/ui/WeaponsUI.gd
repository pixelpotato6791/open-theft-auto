extends CanvasLayer


func _ready():
	WeaponWheel.connect("on_weapon_change", self, "__on_weapon_id_change")
	
func __on_weapon_id_change(index):
	print("WEAPONSUI CALLED FROM HERE")
	for n in get_children():
		n.visible = false
		
	get_child(index).visible = true
