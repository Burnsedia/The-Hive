extends Spatial

export var ignore_rotation = false
export var move_accel = 4
export var max_speed = 25
var body_to_move : KinematicBody = null

var drag = 0.0
var pressed_jump = false
var move_vec : Vector3
var velocity : Vector3
var snap_vec : Vector3
var frozen = false




func _ready():
	drag = float(move_accel) / max_speed
	body_to_move = get_parent()
	init(body_to_move)

func init(_body_to_move: KinematicBody):
	body_to_move = _body_to_move

func jump():
	pressed_jump = true

func set_move_vec(_move_vec: Vector3):
	move_vec = _move_vec.normalized()

func _physics_process(delta):
	if frozen:
		return
	var cur_move_vec = move_vec
	if !ignore_rotation:
		cur_move_vec = cur_move_vec.rotated(Vector3.UP, body_to_move.rotation.y)
	velocity += move_accel * cur_move_vec - velocity * Vector3(drag, 0, drag) * delta
	velocity = body_to_move.move_and_slide(velocity, Vector3.UP)
	

func freeze():
	frozen = true

func unfreeze():
	frozen = false

