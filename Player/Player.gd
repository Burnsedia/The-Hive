extends ship
class_name Player

export var SensorRanger = 100.0
export var mouse_sens = 0.5

export var canHyperJump = true

onready var camera = $Camera
onready var sensors = $Sensor


#Local Class Properties
var exsel = 128
var dead = false
var mov_dir = Vector3()
var target
var hotkeys = {
	KEY_1: 0,
	KEY_2: 1,
	KEY_3: 2,
	KEY_4: 3,
	KEY_5: 4,
	KEY_6: 5,
	KEY_7: 6,
	KEY_8: 7,
	KEY_9: 8,
	KEY_0: 9,
}


# Called when the node enters the scene tree for the first time.
func _ready():	
	get_tree().call_group("hive","set_player", self)
	add_to_group("player")
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _physics_process(delta):
#	pass 

func set_target():
	target = sensors.get_collider()

func auto_target():
	if sensors.get_collider() and sensors.is_in_group("hive"):
		set_target()

func _process(_delta):
	val = mov_vec
	if dead:
		return
	
	var move_vec = Vector3()
	if Input.is_action_pressed("MoveForward"):
		move_vec += transform.basis.z
	if Input.is_action_pressed("MoveBackward"):
		move_vec += -transform.basis.z
	if Input.is_action_pressed("MoveLeft"):
		move_vec += transform.basis.x
	if Input.is_action_pressed("MoveRight"):
		move_vec += -transform.basis.x
	if Input.is_action_pressed("roll_left"):
		rotate_object_local(Vector3.FORWARD, .05)
	if Input.is_action_pressed("roll_right"):
		rotate_object_local(Vector3.FORWARD,-.05)
	if Input.is_action_pressed("rotate_left"):
		rotate_object_local(Vector3.UP, .05)
	if Input.is_action_pressed("rotate_right"):
		rotate_object_local(Vector3.UP, -.05)
	if Input.is_action_pressed("rotate_down"):
		rotate_object_local(Vector3.RIGHT, .05)
	if Input.is_action_pressed("rotate_up"):
		rotate_object_local(Vector3.RIGHT, -.05)
	
	Movement.set_move_vec(move_vec)

# Handle mouse and controler plus touch input
#func _input(event):
#	if event is InputEventMouseMotion or InputEventJoypadMotion:
#		rotation_degrees.y -= mouse_sens * event.relative.x
#		rotation_degrees.x += mouse_sens * event.relative.y

func jump(jumptarget):
	Globals.current_scene.move_child(self)
	Globals.current_scene = jumptarget
	

func hurt(damage, dir):
	Health.hurt(damage, dir)

func heal(amount):
	Health.heal(amount)

func kill():
	dead = true
	Movement.freeze()
	
func _I_am_the_player():
	get_tree().call_group("hive","set_player", self)

