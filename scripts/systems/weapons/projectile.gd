extends Area
class_name bullit

var BULLET_SPEED = 70
var BULLET_DAMAGE = 15

const KILL_TIMER = 4
var timer = 0 

export var speed = 1000

# Called when the node enters the scene tree for the first time.
func _ready():
	self.set_as_toplevel(true)
	connect("body_entered", self, "collided")
	

func _process(delta):
	var forward_dir = transform.basis.z.normalized() * speed * delta
	global_translate(forward_dir)
	timer += delta
	if timer >= KILL_TIMER:
		queue_free()
