class_name Station
extends StaticBody

export var hp = 50
export var wave = 10
export(PackedScene) var drone
export(PackedScene) var missiles



# Called when the node enters the scene tree for the first time.
func _ready():
	lunched_drones()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func damage(damage):
	print("damage taken")
	hp -= damage
	print(hp)
	if hp == 0:
		self.queue_free()
	

func lunched_drones():
	for unit in wave:
		drone.instance()
