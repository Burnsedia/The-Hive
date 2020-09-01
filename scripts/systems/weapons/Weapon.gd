extends Area
class_name weapon

var damage = 10
var shot_timer = Timer.new()
var RoF = 10
export(PackedScene) var bulit
var pos = global_transform


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Events.connect("shoot", self, "_on_shoot")
	shot_timer.wait_time = RoF
	

func use():
	emit_signal("shoot", rotation, pos )
	

# Called every frame. 'delta' is the elapsed time since the previous frame.

		
