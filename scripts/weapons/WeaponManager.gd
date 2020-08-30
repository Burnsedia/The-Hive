extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var weapons = get_children()
# get the SubSystmeManager
var manager = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _init():
	pass

func Fire(cur_weapon: weapon):
	if cur_weapon.has_method("use"):
		cur_weapon.get_cur_weapon().use()
		

func set_cur_weapon():
	pass

func get_cur_weapon(cur_weapon: weapon):
	for wn in weapons:
		if wn == weapon:
			wn = cur_weapon
		return cur_weapon
	
func get_avaible_weapons():
	pass

func cur_weapon_is_overheated(heatLimate: int):
	pass
