extends Spatial

var speed = 3.4

func _ready():
	set_process(true)
	set_process_input(true)
	
func _process(delta):
	# Ship controls
	if(Input.is_action_pressed("ship_forward")):
		get_node("Spaceship").translate(Vector3(-delta * speed, 0, 0))

	if(Input.is_action_pressed("ship_backward")):
		get_node("Spaceship").translate(Vector3(delta * speed / 2, 0, 0))
		
	if(Input.is_action_pressed("ship_pitch_up")):
		get_node("Spaceship").rotate(Vector3(0, 0, 0.6), delta)
		
	if(Input.is_action_pressed("ship_pitch_down")):
		get_node("Spaceship").rotate(Vector3(0, 0, -0.6), delta)
		
	if(Input.is_action_pressed("ship_right")):
		get_node("Spaceship").rotate(Vector3(0, 1.4, 0), delta)
		
	if(Input.is_action_pressed("ship_left")):
		get_node("Spaceship").rotate(Vector3(0, -1.4, 0), delta)
		
	if(Input.is_action_pressed("ship_roll_left")):
		get_node("Spaceship").rotate(Vector3(-2, 0, 0), delta)
		
	if(Input.is_action_pressed("ship_roll_right")):
		get_node("Spaceship").rotate(Vector3(2, 0, 0), delta)
		
func _input(event):
	# Camera controls
	if(event.is_action_pressed("camera_change")):
		if(get_node("Spaceship/FirstPersonCamera").is_current()):
			get_node("Spaceship/ThirdPersonCamera").make_current()
		elif(get_node("Spaceship/ThirdPersonCamera").is_current()):
			get_node("Spaceship/FollowCamera").make_current()
		else:
			get_node("Spaceship/FirstPersonCamera").make_current()
			