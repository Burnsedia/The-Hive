extends Control
	
func _process(delta):
	$NinePatchSpeed/Speedometer.text = "%d" % round(global.player_ship.speed)
	$NinePatchEngine/EngineState.text = "Engine: %s" % global.player_ship.engine_state
	
	if global.player_ship.mouselook:
		$LabelMouselook.show()
	else:
		$LabelMouselook.hide()
