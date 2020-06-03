extends Area


# Declare member variables here. Examples:
# var a = 2
#
var BULLET_SPEED = 70
var BULLET_DAMAGE = 15

const KILL_TIMER = 4
var timer = 0 
var b = "text"

export var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	self.set_as_toplevel(true)
	add_to_group("zombies")
	connect("body_entered", self, "collided")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):



func _physics_process(delta):
	var forward_dir = global_transform.basis.z.normalized()
	global_translate(forward_dir * speed * delta)

	timer += delta
	if timer >= KILL_TIMER:
		queue_free()
