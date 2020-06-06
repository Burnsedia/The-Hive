extends ship

var exsel = 128

var mov_dir = Vector3()

onready var weapon = $Weapon
onready var weapon2 = $Weapon2
onready var weapon3 = $Weapon3

# Called when the node enters the scene tree for the first time.
func _ready():	
 get_tree().call_group("zombies", "set_player", self)
 get_tree().call_group("sectors", "set_player", self)
 connect("shoot", weapon, "use")
 connect("shoot", weapon2, "use")
 connect("shoot", weapon3, "use")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	move_input(delta)

	
func move_input(delta):
	match ship_state:
		combat:
			combat_mode(delta)
			move_and_slide(mov_vec)
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
	if Input.is_action_just_pressed("ui_accept"):
		weapon.use()
		weapon2.use()
		weapon3.use()
	mov_dir = transform.basis.z * speed * delta
	mov_vec = mov_vec.linear_interpolate(mov_dir,64 * delta)
	move_and_slide(mov_vec)
	

func max_vec():
	if mov_vec.x > max_speed.x:
		mov_vec.x = max_speed.x
	if mov_vec.y > max_speed.y:
		mov_vec.y = max_speed.y
	if mov_vec.z > max_speed.z:
		mov_vec.z = max_speed.z	
	

	
