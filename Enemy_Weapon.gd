extends Area


var damage = 10

var can_shoot = false

export(PackedScene) var bulit

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_shoot()


func _shoot():
	var projectile = bulit.instance()
	if can_shoot:
		add_child(projectile)

		
		
	

