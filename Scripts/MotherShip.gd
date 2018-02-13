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
				
			
    


	

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
