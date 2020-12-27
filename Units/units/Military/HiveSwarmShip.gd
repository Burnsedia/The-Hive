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
var acc =  Vector3()
var turn_speed = 10



func _ready() -> void:
	timer.start()
	add_to_group("hive")
	get_tree().call_group("player", "_I_am_the_player")
 
func _process(delta) -> void:
	set_player_vec()
	Movement.set_move_vec(mov_vec)
	
	
func attack() -> void:
	if tgarget.get_collider() == player:
		weapon.use(self)
		can_shoot = false
		timer.start()
		
func kill() -> void:
	dead = true
	$CollisionShape.disabled = true
	queue_free()
 
func set_player(p) -> void:
	player = p
#	print("player is set")

func set_player_vec() -> Vector3:
	var player_vec = player.transform.origin - self.transform.origin
	mov_vec =  player_vec
	
	return mov_vec

#func aim():
#	var disired_rotation = transform.looking_at(player.transform.origin, Vector3.UP)
#	var a = Quat(transform.basis.get_rotation_quat().slerp(disired_rotation.get_rotation_quat())
#	# need too finish this
#	pass

# check if NPC needs to avoid closion
#func avoid() -> Vector3:
#	pass
#
func _on_ShootTimer_timeout() -> void:
	can_shoot = true
	attack()

func damage(damage) -> void:
	print("hit by")
	hp -= damage
	if hp <= 0:
		kill()
