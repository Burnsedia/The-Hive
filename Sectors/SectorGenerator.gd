extends Node

var startSector = load("res://Sceens/BlueNebla-RedStare.tscn")
var player = preload("res://Player/Player.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	startSector.instance()
	startSector.add_child(player)
	Globals.current_scene = startSector
