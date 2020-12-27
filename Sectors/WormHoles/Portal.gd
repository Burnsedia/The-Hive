extends Area
class_name Portal

export(PackedScene) var ConnectedSector 


func _on_Portal_body_entered(body):
	print(body.name + " entered bortal")
	print(body.val)
	ConnectedSector.instance()
	Globals.current_scene = ConnectedSector
	body.queue_free()
	Globals.switch_sceen(ConnectedSector)



	
