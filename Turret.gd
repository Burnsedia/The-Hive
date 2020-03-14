extends Spatial

var max_range = 500

#in degrees per second
export (float) var turn_rate = 720.0
export (bool) var show_aim_ray = false

export (PackedScene) var projectile

var aim_point = Vector3()

var shot_timer = 0
# shots per second
var fire_rate = 2.0


func _ready():
	pass

func _physics_process(delta):
	aim_point = global.current_camera.project_ray_normal(get_viewport().get_mouse_position())
	aim_point = aim_point.normalized() * max_range + global.current_camera.global_transform.origin
	
	rotate_base(delta)
	rotate_barrel(delta)
	
	if Input.is_action_pressed("fire") and shot_timer > 1.0 /fire_rate:
		fire()
		shot_timer = 0
	elif shot_timer < 1.0/ fire_rate:
		shot_timer = shot_timer + delta
		
func fire():
	
	$AudioStreamPlayer3D.play()
	var bullet = projectile.instance()
	var scene_root = get_tree().root.get_children()[0]
	scene_root.add_child(bullet)
	
	bullet.global_transform = $Base/Barrel/SpawnPoint.global_transform
	bullet.scale = Vector3(0.5, 0.5, 0.5)
	
func rotate_base(delta):
	var base_transform = $Base.global_transform
	
	var vector_up = global_transform.basis.y.normalized()
	
	#rotation plane
	var plane = rotation_plane_xz(base_transform)
	
	var look_at = plane.project(aim_point)
	if(typeof(look_at) == TYPE_VECTOR3):
		var z = (look_at - base_transform.origin).normalized()
		var y = vector_up.normalized()
		var x = z.cross(y).normalized()
		var current_rot = Quat(base_transform.basis)
		var target_rot = current_rot.slerp(Basis(x, y, -z), delta * deg2rad(turn_rate))
		$Base.global_transform.basis = Basis(target_rot)
		
func rotate_barrel(delta):
	var base_transform = $Base.global_transform
	var barrel_transform = $Base/Barrel.global_transform
	
	var vector_left = base_transform.basis.x.normalized()
	
	#rotation plane
	var plane = rotation_plane_yz(barrel_transform)
	
	var look_at = plane.project(aim_point)
	if(typeof(look_at) == TYPE_VECTOR3):
		var x = vector_left.normalized()
		var z = (look_at - barrel_transform.origin).normalized()
		var y = x.cross(z).normalized()
		var current_rot = Quat(barrel_transform.basis)
		var target_rot = current_rot.slerp(Basis(x, y, -z), delta * deg2rad(turn_rate))
		$Base/Barrel.global_transform.basis = Basis(target_rot)
	
func rotation_plane_yz(xform):
	var p1 = xform.origin
	var p2 = p1 + xform.basis.y
	var p3 = p1 + xform.basis.z
	return Plane(p1, p2, p3)
	
func rotation_plane_xz(xform):
	var p1 = xform.origin
	var p2 = p1 + xform.basis.x
	var p3 = p1 + xform.basis.z
	return Plane(p1, p2, p3)
