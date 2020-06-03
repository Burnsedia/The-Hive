extends Camera

var player = null

var position = self.translation

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.look_at(player.position,Vector3.UP)

func set_player(p):
	p = player
