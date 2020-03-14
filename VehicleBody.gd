extends VehicleBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 64

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(delta):
	move(delta)
	
	
func move(delta):

	if Input.is_action_pressed("move_forward"):
		translate(-transform.basis.z * speed * delta)
	if Input.is_action_pressed("move_backward"):
		translate(transform.basis.z * speed * delta)
	if Input.is_action_pressed("move_left"):
		translate(-transform.basis.x * speed * delta)
	if Input.is_action_pressed("move_right"):
		translate(transform.basis.x * speed * delta)
	if Input.is_action_pressed("move_up"):
		translate(transform.basis.y * speed * delta)
	if Input.is_action_pressed("move_down"):
		translate(-transform.basis.y * speed * delta)
