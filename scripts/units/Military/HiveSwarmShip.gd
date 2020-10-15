extends ship
class_name HiveSwarmEnemy

# get child subsystem nodes
onready var raycast = $RayCast
onready var tgarget = $targeting 
onready var timer = $ShootTimer
onready var weapon = $Weapon
# collision detection with raycasts
onready var NavRight = $NavRight
onready var NavLeft = $NavLeft
onready var NavUp = $NavUp
onready var NavDown = $NavDown

# class properties 
var can_shoot = false
var player = null
var dead = false
var val = Vector3()
var acc =  Vector3()



func _ready():
	timer.start()
	add_to_group("hive")
 
func _physics_process(delta):
	if dead:
		return
	if player == null:
		return
	acc += move()
	val +=  acc
	move_and_collide(val)
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
	print("player set")

func move():
	var vec_to_player = player.translation - translation
	var faceplayer = player.rotation - self.rotation
	vec_to_player = vec_to_player.normalized()
	raycast.cast_to = vec_to_player * 1.5
	if NavLeft.is_colliding():
		vec_to_player.x -= turn_speed
	if NavRight.is_colliding():
		vec_to_player.x += turn_speed
	if NavUp.is_colliding():
		vec_to_player.y -= turn_speed
	if NavDown.is_colliding():
		vec_to_player.y += turn_speed
	look_at(vec_to_player, Vector3.UP)
	
	return vec_to_player
	
func _on_ShootTimer_timeout():
	can_shoot = true
	timer.start()

func damage(damage):
	print("hit by")
	hp -= damage
	if hp <= 0:
		kill()
