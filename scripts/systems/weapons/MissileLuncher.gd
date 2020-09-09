extends Area
class_name MissileLuncher

export(PackedScene) var missile
func use(user, target):
	shoot(user,target)
	
func shoot(user, target):
	var projectile = missile.instance()
	projectile.set_user(user)
	projectile.set_target(target)
	add_child(projectile)
