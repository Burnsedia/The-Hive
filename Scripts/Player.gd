extends Spatial

var speed = 5.5

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
	