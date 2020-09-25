extends Area
class_name MissileLuncher

export(PackedScene) var missile
export var hp = 100
export var powerusage = 10


func use(user, target):
	shoot(user,target)
	
func shoot(user, target):
	var projectile = missile.instance()
	projectile.set_user(user)
	projectile.set_target(target)
	add_child(projectile)

func damage(damage):
	hp -= damage
	if hp <= 0:
		queue_free()
		print("MissileLuncher distoryed")
