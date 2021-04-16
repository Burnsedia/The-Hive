extends KinematicBody
class_name ship



onready var Movement = $MovementSytem
onready var Health = $HeathMananager
onready var Weapons = $Weaponsmanger

# local varables
var val = Vector3()
var mov_vec = Vector3()
var hp = 500


# States, local Stat matchine
enum States {
   hover,
   combat,
   evade,
   seek, 
   ftl
}

export var ship_state = States.combat


func _ready():
	pass
