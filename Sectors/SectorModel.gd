extends Resource
class_name SectorModel

export var name:String
export var id:int
export var Owned:bool = false
enum {
	HiveSector,
	TiarnSector,
	TyranSector,
	EirdianSector,
	NueterialSector
}

 
#var connected_sectors = {
#	Vector3.LEFT: null,
#	Vector3.RIGHT: null,
#	Vector3.UP: null,
#	Vector3.DOWN: null
#} 

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	id = randi()

# how to we generate a sector
# how are galaxies showed in sci-fi
# whell they are made up of quodrents
# quadreed are made up of sectors

# 4 quatrends




