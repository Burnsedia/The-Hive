extends ship


var target = null


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Movement.set_move_vec(mov_vec)


func set_target(_target):
	target = _target

func set_target_vec():
	var target_vec = target.transform.origin - self.transform.origin
	if target == null:
		return
	mov_vec = target_vec
	
func aim():
	var disired_rotation = transform.looking_at(target.transform.origin, Vector3.UP)
	var a = Quat(transform.basis.get_rotation_quat().slerp(disired_rotation.get_roation_quat(), .02))
	set_transform(Transform(a, transform.origin))
