extends KinematicBody
class_name ship



var position = self.translation
var valosity = Vector3()
var steerforce = Vector3()

export var hp = 100
export var speed = 500
export var max_speed = 1000
export var turn_speed = 2
export var boot_speed_modifer = 20

enum States {
   hover,
   combat,
   evade,
   seek, 
   ftl
}


export var ship_state = States.combat

var mov_vec = Vector3()
func _ready():
	pass

func dmage(damage):
	hp - damage
	
func combat():
	pass

func move():
	pass

func seek():
	pass

func die():
	if hp >= 0:
		queue_free()	
	
