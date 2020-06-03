extends KinematicBody
 
const MOVE_SPEED = 32
onready var raycast = $RayCast
var can_shoot = false
onready var timer = $ShootTimer
onready var bullit = preload("res://scripts/projectile.tscn")

 
var player = null
var dead = false
 
func _ready():
	add_to_group("zombies")
 
func _physics_process(delta):
	if dead:
		return
	if player == null:
		return
	if raycast.is_colliding():
		var coll = raycast.get_collider()
		if coll != null and coll.name == "Player":
			coll.kill()
	attack()
	move(delta)
	
func attack():
	var s = bullit.instance()
	var player_distance = sqrt(player.tranlation - translation)
	var attack_range = 25
	if can_shoot and player_distance < attack_range:
		add_child(s)
		
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
