extends Area
class_name missile 

var hp
var user
var target
var val = Vector3()
var steer = Vector3()
var acc = Vector3()
var force = 10.0

export var speed = 10
export var damage = 500

onready var raycast = $RayCast

func _ready():
	set_as_toplevel(true) 
	val = transform.basis.z.normalized() * speed
	print("missile fired")
	print("cheild of " + str(get_parent()))
	connect("body_entered", self, "_on_missile_body_entered")

func _physics_process(delta):
	acc += seek() 
	val += acc
	global_translate(val * delta)
	
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
	if !target:
		steer = Vector3()
		return steer
		
	
func damage(damage):
	hp -= damage
	if hp <= 0:
		queue_free()

func _on_missile_body_entered(body):
	if body == user:
		return
	print("hit " + str(body))
	body.damage(damage)
	self.queue_free()


func _on_Timer_timeout():
	queue_free()
