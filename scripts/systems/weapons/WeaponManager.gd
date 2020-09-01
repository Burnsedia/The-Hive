extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var weapons = get_children()
# get the SubSystmeManager
var manager = get_parent()
#var default_weapon = weapon_slots.pusle
var cur_weapon = null
var cur_slot = 0
enum weapon_slots { pusle, missile, beam}
var weapon_unlocked = {
	weapon_slots.pusle: true,
	weapon_slots.missile: true,
	weapon_slots.beam: true
}


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _init():
	pass
	

func Fire():
	weapons[cur_weapon].use()
	
func set_weapon(index:int):
	if index < 0 or index >= weapon_unlocked.size():
		return 
	if !weapon_unlocked[cur_slot]:
		return 
	cur_weapon = weapons[index]
	return cur_weapon
	
func next_weapon(slot_index):
	pass

func switch_weapon():
	cur_weapon = (cur_slot +1) % weapon_unlocked.size()
	if !weapon_unlocked[cur_weapon]: switch_weapon()
	else: set_weapon(cur_weapon)
	



	
		
