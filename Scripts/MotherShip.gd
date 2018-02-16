extends MotherShip
var speed = 200




func _ready():
	_set_fixed_procces(true)
func _fixed_process(delta):
	var Move = Vector3
	var Body = get_node("body").get_overlapping_bodies()
	if Body.size != 0:
		for thing in Body:
			if thing.is_in_group("player"):
				if thing.get_position().x < self.global_position.x:
					Move = Move.normalized()* speed
				elif thing.get_position().y < self.global_position.y:
					Move = Move.normalized()* speed
			    else thing.get_position().z < self.global_position.z:
				   	Move = Move.normalized()* speed	
func Is_in_range("player"):
	var weapon_range = 75
	var fire_rate = 10
	

	get_nodes_in_group("player") and get_overlapping_areas()
	for thing in Area:
	 if get_nodes_in_group("player") and get_overlapping_areas() <= weapon_range:
		 pass
	 elif condition:
		 pass
	 else:
		 pass
				    
			
    


	

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
