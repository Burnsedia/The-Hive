extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var weapons = get_children()
# get the SubSystmeManager
var manager = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _init():
	pass

func Fire(cur_weapon: weapon):
	emit_signal("shoot")

func init_weapons():
	Events.connect("shoot", weapons, "use")
