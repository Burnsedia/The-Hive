extends Node

# TODO: Emplentment randome walk
# TODO: use a referances class
# TODO: Tis is cool



var startSector = load("res://Sceens/BlueNebla-RedStare.tscn")
var player = preload("res://Player/Player.tscn")
var sectoricon = preload("res://Sectors/UI/Sector2d.tscn")
var grid_size = 6 
var grid_spread = 35
var grid_setps = 35
var grid = []

const dir = [ Vector2.RIGHT, Vector2.LEFT, Vector2.UP, Vector2.DOWN]

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	create_level()
	
func create_level():
	pass
	

