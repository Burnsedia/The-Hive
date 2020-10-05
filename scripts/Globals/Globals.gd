extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_wave()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func switch_sceen(sceen):
	pass

func mission():
	pass

func spawn_wave():
	var sector = get_tree().current_scene()
	sector.spawn_drones()
	sector.spawn_Hives()


