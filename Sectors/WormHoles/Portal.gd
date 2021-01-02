extends Area
class_name Portal

export(PackedScene) var ConnectedSector 

# sent body to next sector
func _on_Portal_body_entered(body:KinimaticBody) -> void:
	print(body.name + " entered bortal")
	print(body.val)
	get_tree().change_scene_to(ConnectedSector)
	Globals.current_scene = ConnectedSector
	body.queue_free()
	