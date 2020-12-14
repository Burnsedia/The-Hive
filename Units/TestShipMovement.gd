extends KinematicBody

export var thrust = 1.0
export var turn_speed = 5
export var mov_dir:Vector3 = Vector3.ZERO
onready var gun = $Weapon
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const MAX_SPEED = 5.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move(delta)
	if Input.is_action_just_pressed("shoot"):
		gun.use(self)


func move(delta):
	var mov_vec:Vector3
	if Input.is_action_pressed("MoveRight"):
		mov_dir += transform.basis.x * thrust * delta
	if Input.is_action_pressed("MoveLeft"):
		mov_dir -= transform.basis.x * thrust * delta
	if Input.is_action_pressed("MoveUP"):
		mov_dir += transform.basis.y * thrust * delta
	if Input.is_action_pressed("MoveDown"):
		mov_dir -= transform.basis.y * thrust * delta
	if Input.is_action_pressed("MoveForward"):
		mov_dir -= transform.basis.z * thrust * delta
	if Input.is_action_pressed("MoveBackward"):
		mov_dir += transform.basis.z * thrust * delta
	if Input.is_action_just_released("MoveRight"):
		mov_vec.linear_interpolate(mov_dir, -MAX_SPEED *delta)
	if Input.is_action_just_released("MoveLeft"):
		mov_vec.linear_interpolate(mov_dir, -MAX_SPEED * delta)
	if Input.is_action_just_released("MoveUP"):
		mov_vec.linear_interpolate(mov_dir, -MAX_SPEED * delta)
	if Input.is_action_just_released("MoveForward"):
		mov_vec.linear_interpolate(mov_dir, -MAX_SPEED * delta)
	if Input.is_action_just_released("MoveBackward"):
		mov_vec.linear_interpolate(mov_dir,-MAX_SPEED * delta)
		
		
	#Roll the Ship on the z
	if Input.is_action_pressed("roll_left"):
		rotate_object_local(Vector3(0,0,1), turn_speed * delta)
	if Input.is_action_pressed("roll_right"):
		rotate_object_local(Vector3(0,0,1), -turn_speed * delta)
	#Rotate the Ship	
	if Input.is_action_pressed("rotate_down"):
		rotate_object_local(Vector3.RIGHT, turn_speed * delta)
	if Input.is_action_pressed("rotate_up"):
		rotate_object_local(Vector3.RIGHT, -turn_speed * delta)
		
	if Input.is_action_pressed("rotate_left"):
		rotate_object_local(Vector3.UP, turn_speed * delta)
	if Input.is_action_pressed("rotate_right"):
		rotate_object_local(Vector3.UP, -turn_speed * delta)
	
	mov_vec = mov_dir
	
	mov_vec.linear_interpolate(mov_vec, MAX_SPEED * delta)
	
	
	move_and_collide(mov_vec)
