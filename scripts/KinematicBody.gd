extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 64
export var turn_speed = 8
export var boot_speed = 2
onready var guid = $mov_guid

var turn_left = false
var trun_right = false

var rot_x = 0.0
var rot_y = 0.0
var rot_z = 0.0

var mov_x = 0.0
var mov_y = 0.0
var mov_z = 0.0
var mov_vec = Vector3()



# Called when the node enters the scene tree for the first time.
func _ready():
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	move_input(delta)
	move_and_slide(mov_vec, Vector3.UP)
	
		
	
	
func move_input(delta):
	#start moving player.
	if Input.is_action_pressed("ui_left"):
		mov_vec -= transform.basis.x * speed * delta
	if Input.is_action_pressed("ui_right"):
		mov_vec += transform.basis.x * speed * delta
	if Input.is_action_pressed("ui_down"):
		mov_vec -= transform.basis.y*speed * delta
	if Input.is_action_pressed("ui_up"):
		mov_vec += transform.basis.y* speed * delta
	#stop moving player
	if Input.is_action_just_released("ui_left"):
		mov_vec = Vector3(0,0,mov_vec.z)
	if Input.is_action_just_released("ui_right"):
		mov_vec = Vector3(0,0,mov_vec.z)
	if Input.is_action_just_released("ui_up"):
		mov_vec = Vector3(0,0,mov_vec.z)
	if Input.is_action_just_released("ui_down"):
		mov_vec = Vector3(0,0,mov_vec.z)
	mov_vec += -transform.basis.z * speed * delta

		
	
	
