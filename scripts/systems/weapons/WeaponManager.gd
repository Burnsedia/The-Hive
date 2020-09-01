extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var weapons = get_children()
# get the SubSystmeManager
var manager = get_parent()
var default_weapon = weapons.front()
var equiped_weapon = null


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _init():
	set_weapon(default_weapon)

func Fire():
	weapons[equiped_weapon].use()
	
func set_weapon(cur_weapon):
	if cur_weapon == default_weapon:
		return
	
	cur_weapon = equiped_weapon
	return cur_weapon

	
		
