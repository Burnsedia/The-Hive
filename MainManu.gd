extends Control


onready var NewGame = $menu/Hb/cc/Butons/NewGame
onready var LoadGame = $menu/Hb/cc/Butons/LoadGame
onready var Options = $menu/Hb/cc/Butons/Options
onready var Settings = $menu/Hb/cc/Butons/Settings
onready var Exit = $menu/Hb/cc/Butons/Exit

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_NewGame_pressed():
	get_tree().change_scene("res://Sceens/Game_Root.tscn")


func _on_Exit_pressed():
	get_tree().quit()
