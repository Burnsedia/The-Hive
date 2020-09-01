extends KinematicBody
class_name ship



var position = self.translation

export var hp = 100
export var speed = 1000
export var max_speed = 512

export var turn_speed = 8
export var boot_speed_modifer = 2


# I	need to rework the AI
#onready var StateMachine = $StateMachine
onready var Subsystems = $SubSystemManager
onready var weapons = $SubSystemManger/WeaponManger





#behavers
enum{hover,combat,evade,seek, ftl }


var turn_left = false
var trun_right = false

var ship_state = combat

var mov_vec = Vector3()
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

	
