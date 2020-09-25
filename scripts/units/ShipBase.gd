extends KinematicBody
class_name ship



var position = self.translation

export var hp = 100
export var speed = 1024
export var max_speed = 2048

export var turn_speed = 2
export var boot_speed_modifer = 2

enum States {
   hover,
   combat,
   evade,
   seek, 
   ftl
}


var ship_state = States.combat

var mov_vec = Vector3()
func _ready():
	pass

func dmage(damage):
	hp - damage
	
func combat():
	pass

func move(delta):
	pass

func die():
	if hp >= 0:
		queue_free()	
