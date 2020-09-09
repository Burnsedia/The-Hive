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


	

func Fire():
	for weap in weapons:
		if weap.has_method("use"):
			weap.use()
			

	
func next_weapon(slot_index):
	pass


	



	
		
