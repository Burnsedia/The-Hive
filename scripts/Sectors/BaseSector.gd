extends Spatial
class_name Sector

# not ownded by anyone
var nutreal = true
# ownded my the hive
var enemy = false
# you own it
var yours = false
# one of your allies
var allied = false
# has artifiact
var contains_artifacts = false
# the secorts varables
export var radius = 500
# exported varables
# this must be configured in the editor
# units and buiding in sector
export(PackedScene) var drone 
export(PackedScene) var MotherShip
export(PackedScene) var Stations
export(PackedScene) var astroids
export(PackedScene) var artifacts

# Enemy unit and station counts
export var enemy_mothership_count = 5
export var enemy_drone_count = 50 
export var station_count = 5

# astoids
export (bool) var random_rotation
export (Vector2) var scale_range
export var astroid_count = 5000

# number of artifacts if there are any
var artifacts_count = rand_range(2.0, 16.0)

# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.current_scene = self
	for i in station_count:
		spawn_stations()
	for i in astroid_count:
		spawn_astroids()	
	for i in enemy_drone_count:
		spawn_drones()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Spawn Astroids
func spawn_astroids():
	var spawn_position = Vector3()
	var spawn_rotation = Vector3()
	var asteroid = astroids.instance()
	#randomize rotation
	spawn_rotation.x = rand_range(-radius, radius)
	spawn_rotation.y = rand_range(-radius, radius)
	spawn_rotation.z = rand_range(-radius, radius)
	# randomize postion
	spawn_position.x = rand_range(-radius, radius)
	spawn_position.y = rand_range(-radius, radius)
	spawn_position.z = rand_range(-radius, radius)
	#set astroid postion and rotation
	asteroid.translation = spawn_position
	asteroid.rotation = spawn_rotation
	add_child(asteroid)
	
# Spawn enemy hives
func spawn_Hives():
	var spawn_position = Vector3()
	var spawn_rotation = Vector3()
	var mothership = MotherShip.instance()
	#randomize rotation
	spawn_rotation.x = rand_range(-radius, radius)
	spawn_rotation.y = rand_range(-radius, radius)
	spawn_rotation.z = rand_range(-radius, radius)
	# randomize position
	spawn_position.x = rand_range(-radius, radius)
	spawn_position.y = rand_range(-radius, radius)
	spawn_position.z = rand_range(-radius, radius)
	# set position
	mothership.translation = spawn_position
	# set rotation
	add_child(mothership)
	
# Spawn enemy hives drones
func spawn_drones():
	var spawn_position = Vector3()
	var spawn_rotation = Vector3()
	var hive_drone = drone.instance()
	#randomize rotation
	spawn_rotation.x = rand_range(-radius, radius)
	spawn_rotation.y = rand_range(-radius, radius)
	spawn_rotation.z = rand_range(-radius, radius)
	# randomize position
	spawn_position.x = rand_range(-radius, radius)
	spawn_position.y = rand_range(-radius, radius)
	spawn_position.z = rand_range(-radius, radius)
	# set position
	hive_drone.translation = spawn_position
	# add drone to scene	
	add_child(hive_drone)
	get_tree().call_group("hive", "set_player", Globals.player)
	
func spawn_stations():
	var spawn_position = Vector3()
	var station = Stations.instance()
	# randomize position
	spawn_position.x = rand_range(-radius, radius)
	spawn_position.y = rand_range(-radius, radius)
	spawn_position.z = rand_range(-radius, radius)
	# Set Station position 
	station.translation = spawn_position
	# Add station to scene
	add_child(station)
