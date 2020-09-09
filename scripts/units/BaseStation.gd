class_name Station
extends StaticBody

export var hp = 50
export(PackedScene) var defiances


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func damage(damage):
	print("damage taken")
	hp -= damage
	print(hp)
	if hp == 0:
		self.queue_free()
	
