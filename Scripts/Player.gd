extends Spatial

var speed = 5.5
var Yaw = 5.5
var Pich = 5.5

func _ready():
	set_process(true)
	set_process_input(true)
	

func _process(delta):
	if Input.is_action_pressed("Forward"):
		get_node("player").translate(Vector3(delta*speed,0,0))
	if Input.is_action_pressed("Backword"):
		get_node("player").translate(Vector3(-delta *speed,0,0))
	if Input.is_action_pressed("Left"):
		get_node("player").translate(Vector3(0,0,-delta*speed))
	if Input.is_action_pressed("Right"):
		get_node("player").translate(Vector3(0,0,delta*speed))
	if Input.is_action_pressed("Up"):
		get_node("player").translate(Vector3(0,delta*speed,0))
	if Input.is_action_pressed("Down"):
		get_node("player").translate(Vector3(0,-delta*speed,0))
	if Input.is_action_pressed("Role_Left"):
		get_node("player").rotate(Vector3(-Yaw,0,0))
	if Input.is_action_pressed("Role_Right"):
		get_node("player").rotate(Vector3(Yaw,0,0))
    if Input.is_action_pressed("Pich_Up"):
	    get_node("player").rotate(Vector3(0,Pich,0))
	if Input.is_action_pressed("Pich_Down"):
		get_node("player").rotate(Vector3(0,-Pich))