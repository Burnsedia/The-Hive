extends ship

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Take Damage
func damage(damage):
	print("damage taken")
	hp -= damage
	print(hp)
	print("hit by" )
	if hp <= 0:
		self.queue_free()
	emit_signal("MotherShipDistroyed")
