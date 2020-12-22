extends ship
class_name Player

export var SensorRanger = 100.0
export var mouse_sens = 0.5

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
	Movement.init(self)
#	Health.init(self)
#	Weapons.init(self)
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
#	move_input(delta)
	pass 

func set_target():
	target = sensors.get_collider()

func auto_target():
	if sensors.get_collider() and sensors.is_in_group("hive"):
		set_target()

func _process(_delta):
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()
	
	if dead:
		return
	
	var move_vec = Vector3()
	if Input.is_action_pressed("move_forwards"):
		move_vec += Vector3.FORWARD
	if Input.is_action_pressed("move_backwards"):
		move_vec += Vector3.BACK
	if Input.is_action_pressed("move_left"):
		move_vec += Vector3.LEFT
	if Input.is_action_pressed("move_right"):
		move_vec += Vector3.RIGHT
	
	Movement.set_move_vec(move_vec)
	if Input.is_action_just_pressed("jump"):
		Movement.jump()
	
	Weapons.attack(Input.is_action_just_pressed("attack"), 
		Input.is_action_pressed("attack"))

func _input(event):
	if event is InputEventMouseMotion:
		rotation_degrees.y -= mouse_sens * event.relative.x
		camera.rotation_degrees.x -= mouse_sens * event.relative.y
		camera.rotation_degrees.x = clamp(camera.rotation_degrees.x, -90, 90)
	if event is InputEventKey and event.pressed:
		if event.scancode in hotkeys:
			Weapons.switch_to_weapon_slot(hotkeys[event.scancode])
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == BUTTON_WHEEL_DOWN:
			Weapons.switch_to_next_weapon()
		if event.button_index == BUTTON_WHEEL_UP:
			Weapons.switch_to_last_weapon()

func hurt(damage, dir):
	Health.hurt(damage, dir)

func heal(amount):
	Health.heal(amount)

func kill():
	dead = true
	Movement.freeze()


# Replace with function body.
