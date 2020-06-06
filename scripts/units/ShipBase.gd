extends KinematicBody
class_name ship



var position = self.translation

export var hp = 100
export var speed = 1000
export var max_speed = 512

export var turn_speed = 8
export var boot_speed = 2



#
signal shoot
signal call_for_help

#behavers
enum{flt,combat,evade,seek }


var turn_left = false
var trun_right = false

var ship_state = combat

var mov_vec = Vector3()
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func combat_mode(delta):
	pass
	
	
func flt_mode(delta):
	pass
	
func evade_mode(delta):
	pass

func seek(delta):
	pass
	
func move(delta):
	pass
	
