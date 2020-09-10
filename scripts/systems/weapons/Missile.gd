extends Area
class_name missile 

var user
var target
var val = Vector3()
var steer = Vector3()
var acc = Vector3()
var force = 50.0

export var speed = 50
export var damage = 500

onready var raycast = $RayCast

func _ready():
	set_as_toplevel(true) 
	val = transform.basis.z * speed
	print("missile fired")

func _physics_process(delta):
	acc += seek()
	val += acc 
	translation += val * delta
	
func set_user(u):
	user = u
	
func set_target(t):
	target = t
	
func seek():
	if target:
		var vec_to_target = target.translation - self.translation
		vec_to_target = vec_to_target.normalized() * speed
		steer = (vec_to_target - val).normalized() * force
	return steer
		
func _on_Timer_timeout():
	print("missile out of time")
	queue_free()

func _on_missile_body_entered(body):
	if body == "player":
		return
	body.damage(damage)
	print("missile hit " + body)
	queue_free()
