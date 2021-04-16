extends Area
class_name Portal


export(PackedScene) var ConnectedSector 
onready var _sector = get_parent()

# sent body to next sector

func _on_Portal_body_entered(body) -> void:
	print(body.name + " entered bortal")
	print(body.val)
	get_tree().change_scene_to(ConnectedSector)
	body.get_tree().change_scene_to(ConnectedSector)
	body.queue_free() 
	ConnectedSector.add_child(body)
	
