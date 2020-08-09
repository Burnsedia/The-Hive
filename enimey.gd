extends KinematicBody
 
const MOVE_SPEED = 32
onready var raycast = $RayCast
var can_shoot = false
onready var timer = $ShootTimer
onready var weapon = $Enemy_Weapon



 
var player = null
var dead = false
 
func _ready():
	add_to_group("zombies")
	
	Events.connect("shoot",weapon, "_on_owner_ship_shoot")

 
func _physics_process(delta):
	if dead:
		return
	if player == null:
		return
	attack()
	move(delta)
	
func attack():
	emit_signal("shoot")
		
func kill():
	dead = true
	$CollisionShape.disabled = true
	queue_free()
 
func set_player(p):
	player = p

func move(delta):
	var vec_to_player = player.translation - translation
	vec_to_player = vec_to_player.normalized()
	raycast.cast_to = vec_to_player * 1.5
	self.look_at(vec_to_player,Vector3.UP)
	move_and_collide(vec_to_player * MOVE_SPEED * delta)
	
	

func _on_ShootTimer_timeout():
	can_shoot = true
	timer.start()
