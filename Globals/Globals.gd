extends Node

var current_scene = null
var player = null

# Called when the node enters the scene tree for the first time.
func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)
	print(str(current_scene)+ " is current scene")

func set_current_scene():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)

func mission():
	pass

func spawn_wave():
	var sector = current_scene
	sector.spawn_drones()
	sector.spawn_Hives()

func _shoot(bullit, direction, position):
	var b = bullit.instance()
	current_scene.add_child(b)
	b.rotation = direction
	b.transform.origin = position

func JumpToSector(start, end):
	pass
