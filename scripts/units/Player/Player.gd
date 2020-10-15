extends ship
class_name Player

export var thrust = 1.0
export var SensorRanger = 100.0

# Child Componits and ther manager classes
# Weapon interface this will be replaced with a weapon manger 
# It will allow to control npc ships
onready var gun = $Weapon
onready var luncher = $MissileLuncher
onready var luncher2 = $MissileLuncher2
onready var sensors = $sensor

#Local Class Properties
var exsel = 128
var mov_dir = Vector3()
var target

# Called when the node enters the scene tree for the first time.
func _ready():	
 get_tree().call_group("hive", "set_player", self)
 get_tree().call_group("player", "set_player", self)
 Events.connect("shoot", gun, "use")
 Events.connect("fire_missile", luncher, "use")
 Events.connect("fire_missile", luncher2, "use")
 add_to_group("player")
 Globals.player = self

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	move_input(delta)

func move_input(delta):
	match ship_state:
		States.combat:
			combat_mode(delta)
			move_and_slide(mov_vec)
		States.hover:
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
		ship_state = States.combat
	
	mov_dir * speed * delta
	move_and_collide(mov_dir)

	

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
	if Input.is_action_pressed("shoot"):
		gun.use(self)
	if Input.is_action_just_pressed("manu"):
		get_tree().change_scene("res://Sceens/MainManu.tscn")
	if Input.is_action_just_pressed("fire_missle"):
		if !target == null:
			luncher.use(self, target)
			print("fired missile at " + str(target))
			
	if Input.is_action_just_pressed("lookon"):
		print("looked on to " + str(target))
		set_target()
		
	if Input.is_action_just_pressed("hover_mode"):
		ship_state = States.hover
	
	if Input.is_action_pressed("bost"):
		mov_dir = transform.basis.z * speed * boot_speed_modifer
	else:		
		mov_dir = transform.basis.z * speed * delta
	mov_vec = mov_vec.linear_interpolate(mov_dir, 10 * delta)
	move_and_slide(mov_vec)

func set_target():
	target = sensors.get_collider()

func auto_target():
	if sensors.get_collider() and sensors.is_in_group("hive"):
		set_target()
			
func damage(damage):
	hp -= damage
	print(hp)
	if hp <= 0:
		queue_free()
