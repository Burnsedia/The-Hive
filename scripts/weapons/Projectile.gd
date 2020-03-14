extends Spatial

# m/s
export (float) var speed = 600
export (float) var damage = 20

var kill_timer = 0.833
var timer = 0

var relative_vel

func _ready():
	$Area.connect("body_entered", self, "collided")
	relative_vel = global.player_ship.linear_velocity

func _physics_process(delta):
	var forward_dir = -global_transform.basis.z.normalized()
	global_translate((forward_dir * speed + relative_vel) * delta)
	
	timer += delta;
	if timer >= kill_timer:
		queue_free()


func collided(body):
	for i in $Area.get_overlapping_bodies():
		if i == global.player_ship:
			return

	queue_free()
