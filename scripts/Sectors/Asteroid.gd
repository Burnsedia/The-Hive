extends StaticBody
class_name Astroid

export var hp = 100
export var MineralCount = 100



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

sync func damage(damage):
	print("damage taken")
	hp -= damage
	print(hp)
	print("hit by" )
	if hp <= 0:
		self.queue_free()
