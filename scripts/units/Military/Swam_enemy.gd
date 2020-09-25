extends ship
class_name swam_enemy

# get child subsystem nodes
onready var raycast = $RayCast
onready var tgarget = $targeting 
onready var timer = $ShootTimer
onready var weapon = $Weapon

# class properties 
var can_shoot = true
var player = null
var dead = false
 
func _ready():
	timer.start()
	add_to_group("hive")
	_init()
	

 
func _physics_process(delta):
	if dead:
		return
	if player == null:
		return
	move(delta)
	attack()
	
func attack():
	if tgarget.get_collider() == player:
		weapon.use(self)
		can_shoot = false
		timer.start()

		
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
	look_at(vec_to_player,Vector3.UP)
	move_and_collide(vec_to_player * speed * delta)
	

func _on_ShootTimer_timeout():
	can_shoot = true
	timer.start()

func damage(damage):
	print("hit by")
	hp -= damage
	if hp <= 0:
		kill()
