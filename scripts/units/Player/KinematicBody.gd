extends KinematicBody
class_name Player


var position = self.translation

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var hp = 100
export var speed = 16

export var turn_speed = 8
export var boot_speed = 2

onready var weapon = $Weapon

signal shoot


enum{flt,combat}


var turn_left = false
var trun_right = false

var ship_state = combat
#var rot_x = 0.0
#var rot_y = 0.0
#var rot_z = 0.0
var mov_vec = Vector3()

# Called when the node enters the scene tree for the first time.
func _ready():	
 get_tree().call_group("zombies", "set_player", self)
 get_tree().call_group("sectors", "set_player", self)
 connect("shoot", weapon, "Shoot")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	move_input(delta)
	move_and_slide(mov_vec, Vector3.UP)
	
func move_input(delta):
	match ship_state:
		combat:
			combat_mode(delta)
		flt:
			hover_mode(delta)
		

func hover_mode(delta):
	pass
	

func combat_mode(delta):
	#start moving player.
	if Input.is_action_pressed("ui_left"):
		rotate_object_local(Vector3(0,1,0), turn_speed * delta)
	if Input.is_action_pressed("ui_right"):
		rotate_object_local(Vector3(0,1,0), -turn_speed * delta)
	if Input.is_action_pressed("ui_down"):
		rotate_object_local(Vector3(1,0,0), -turn_speed * delta)
	if Input.is_action_pressed("ui_up"):
		rotate_object_local(Vector3(1,0,0), turn_speed * delta)
	if Input.is_action_pressed("roll_right"):
		rotate_object_local(Vector3(0,0,1), turn_speed * delta)		
	if Input.is_action_pressed("roll_left"):
		rotate_object_local(Vector3(0,0,1), -turn_speed * delta)		
	#stop moving player
	if Input.is_action_just_released("ui_left"):
		mov_vec = Vector3(0,0,mov_vec.z)
		rotate(Vector3.UP, 0)
	if Input.is_action_just_released("ui_right"):
		mov_vec = Vector3(0,0,mov_vec.z)
		rotate(Vector3.UP, 0)
	if Input.is_action_just_released("ui_up"):
		mov_vec = Vector3(0,0,mov_vec.z)
		rotate(Vector3.UP, 0)
	if Input.is_action_just_released("ui_down"):
		mov_vec = Vector3(0,0,mov_vec.z)
		rotate(Vector3.UP, 0)
	if Input.is_action_just_pressed("ui_accept"):
		emit_signal("shoot")
	mov_vec += transform.basis.z * speed * delta
	

		
	
		
	
	
