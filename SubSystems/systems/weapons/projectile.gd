extends Area
class_name bullit

export var BULLET_DAMAGE = 50

var user
const KILL_TIMER = 4
var timer = 0 

var velocity = Vector3()
export var speed = 1000

# Called when the node enters the scene tree for the first time.
func _ready():
	self.set_as_toplevel(true)
	connect("body_entered", self, "collided")
	

func set_user(u):
	user = u

func _physics_process(delta):
	velocity = transform.basis.z.normalized() * speed * delta
	global_translate(velocity)
	timer += delta
	if timer >= KILL_TIMER:
		queue_free()


func _on_Builit_body_entered(body):
	if body == user:
		return 
	body.damage(BULLET_DAMAGE)
	print(body.name)
		
		
		
		
