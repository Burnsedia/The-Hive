extends Area
class_name missile 


var user
var target
var val = Vector3()
var steer = Vector3()
var acc = Vector3()
var force = 100.0

export var speed = 100
export var damage = 1000
onready var raycast = $RayCast



func _ready():
	set_as_toplevel(true) 
	val = transform.basis.z * speed


func _physics_process(delta):
	acc += seek()
	val += acc 
	rotation.direction_to(val)
	translation += val
	

func set_user(u):
	user = u
	
func set_target(t):
	target = t
	

	
func seek():
	steer = Vector3()
	if target:
		var vec_to_target = target.translation - self.translation
		vec_to_target = vec_to_target.normalized() * speed
		steer = (vec_to_target - val).normalized() * force
	return steer
		

func _on_missile_body_entered(body):
	if body == user:
		return 
	body.damage(damage)
	print(body.name)
	queue_free()
