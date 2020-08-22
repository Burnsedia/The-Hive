extends ship

export var thrust = 1.0
var exsel = 128

var mov_dir = Vector3()

onready var weapon = $Weapon
onready var weapon2 = $Weapon2
onready var weapon3 = $Weapon3

# Called when the node enters the scene tree for the first time.
func _ready():	
 get_tree().call_group("zombies", "set_player", self)
 get_tree().call_group("sectors", "set_player", self)
 Events.connect("shoot", weapon, "use")
 Events.connect("shoot", weapon2, "use")
 Events.connect("shoot", weapon3, "use")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	move_input(delta)

	
func move_input(delta):
	match ship_state:
		combat:
			combat_mode(delta)
			move_and_slide(mov_vec)
		hover:
			hover_mode(delta)
		

func hover_mode(delta):
	var mov_dir
	var mov_vec
	
	if Input.is_action_just_pressed("ui_left"):
		mov_dir.x + thrust
	if Input.is_action_just_pressed("ui_right"):
		mov_dir.x - thrust
	if Input.is_action_just_pressed("ui_up"):
		mov_dir.y + thrust
	if Input.is_action_just_pressed("ui_down"):
		mov_dir.y - thrust
	if Input.is_action_just_pressed("ui_select"):
		mov_dir.z + thrust
	if Input.is_action_just_pressed("combat_mode"):
		ship_state = combat
	
	mov_dir * speed * delta
	move_and_slide(mov_dir)

	

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
		weapon.shoot()
		weapon2.shoot()
		weapon3.shoot()
		
	if Input.is_action_just_pressed("hover_mode"):
		ship_state = hover
	mov_dir = transform.basis.z * speed * 5  * delta
	mov_vec = mov_vec.linear_interpolate(mov_dir,72 * delta)
	move_and_slide(mov_vec)


func max_vec():
	if mov_vec.x > max_speed.x:
		mov_vec.x = max_speed.x
	if mov_vec.y > max_speed.y:
		mov_vec.y = max_speed.y
	if mov_vec.z > max_speed.z:
		mov_vec.z = max_speed.z	
	

	
