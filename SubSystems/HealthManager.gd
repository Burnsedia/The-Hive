extends Spatial

#var blood_spray = preload("res://effects/BloodSpray.tscn")
#var gibs = preload("res://effects/Gibs.tscn")

signal dead
signal hurt
signal healed
signal health_changed
signal gibbed

export var max_health = 100
var cur_health = 1

export var gib_at = -10

func _ready():
	pass

func init():
	cur_health = max_health
	emit_signal("health_changed", cur_health)

func hurt(damage: int, dir: Vector3):
#	spawn_blood(dir)
	if cur_health <= 0:
		return
	cur_health -= damage
	if cur_health <= gib_at:
		emit_signal("gibbed")
	if cur_health <= 0:
		emit_signal("dead")
	else:
		emit_signal("hurt")
	emit_signal("health_changed", cur_health)

func heal(amount: int):
	if cur_health <= 0:
		return
	cur_health += amount
	if cur_health > max_health:
		cur_health = max_health
	emit_signal("healed")
	emit_signal("health_changed", cur_health)

#func spawn_blood(dir):
#	var blood_spray_inst = blood_spray.instance()
#	get_tree().get_root().add_child(blood_spray_inst)
#	blood_spray_inst.global_transform.origin = global_transform.origin
#
#	if dir.angle_to(Vector3.UP) < 0.00005:
#		return
#	if dir.angle_to(Vector3.DOWN) < 0.00005:
#		blood_spray_inst.rotate(Vector3.RIGHT, PI)
#		return
#
#	var y = dir
#	var x = y.cross(Vector3.UP)
#	var z = x.cross(y)
#
#	blood_spray_inst.global_transform.basis = Basis(x, y, z)

#func spawn_gibs():
#	var gibs_inst = gibs.instance()
#	get_tree().get_root().add_child(gibs_inst)
#	gibs_inst.global_transform.origin = global_transform.origin
#	gibs_inst.enable_gibs()

#func get_pickup(pickup_type, ammo):
#	match pickup_type:
#		Pickup.PICKUP_TYPES.HEALTH:
#			heal(ammo)
