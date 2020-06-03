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



# nomber of astroids
var astroid_count = rand_range( 8.0, 64.0)
# number of artifacts if there are any
var artifacts_count = rand_range(2.0, 16.0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
