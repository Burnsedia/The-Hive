extends MotherShip
var speed = 200
var weapon_rang = 75 



func _ready():
	_set_fixed_procces(true)
func _fixed_process(delta):
	var Move = Vector3
	var Body = get_node("body").get_overlapping_areas()
	if Body.size != 0:
		for thing in Body:
			if condition:
				pass
    


	

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
