extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 16
var ftl = false
var sub_light =  true



# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _process(delta):
	flight_controle()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
#	flight_controle()
	move(delta)
	
	
	
func move(delta):
	if not sub_light:
		ftl_mode(delta)
	else:
		nowtowenin_flight_mode(delta)

func nowtowenin_flight_mode(delta):
	if sub_light == true:
		ftl = false
	var vec = transform
	if Input.is_action_pressed("move_forward"):
		move_and_collide(-vec.basis.z * speed * delta)	
	if Input.is_action_pressed("move_backward"):
		move_and_collide(vec.basis.z * speed * delta)
	if Input.is_action_pressed("move_left"):
		move_and_collide(-vec.basis.x * speed * delta)
	if Input.is_action_pressed("move_right"):
		move_and_collide(vec.basis.x * speed * delta)
	if Input.is_action_pressed("move_up"):
		move_and_collide(vec.basis.y * speed * delta)
	if Input.is_action_pressed("move_down"):
		move_and_collide(-vec.basis.y * speed * delta)

func ftl_mode(delta):
	if ftl == true:
		sub_light = false
	var vec = transform
	translate(-vec.basis.z * speed * delta)
	if Input.is_action_pressed("move_left"):
		move_and_collide(-vec.basis.x * speed * delta)
	if Input.is_action_pressed("move_right"):
		move_and_collide(vec.basis.x * speed * delta)
	if Input.is_action_pressed("move_forward"):
		move_and_collide(vec.basis.y * speed * delta)
	if Input.is_action_pressed("move_backward"):
		move_and_collide(-vec.basis.y * speed * delta)

func flight_controle():
	if Input.is_action_pressed("flight_mode_controle"):
		print_debug("I preses the swich flight mode botton")
		if ftl == false:
			ftl = true
			sub_light = false
		if sub_light == false:
			sub_light = true
			ftl = false
	
