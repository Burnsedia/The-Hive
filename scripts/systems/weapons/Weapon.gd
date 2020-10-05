
extends Area
class_name weapon

var damage = 10
var shot_timer = Timer.new()
var RoF = 10
var player_owned = false


export(PackedScene) var bulit

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	

func use(user, target:ship = null):
	shoot(user, target)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func shoot(user, target = null):
	var projectile = bulit.instance()
	projectile.set_user(user)
	add_child(projectile)
		

