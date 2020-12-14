extends Camera

var player = null

var position = self.translation

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var vec_to_player =  player.translation - self.translation
	self.look_at(vec_to_player, Vector3.UP)

func set_player(p):
	p = player
