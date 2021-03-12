extends Resource
class_name GalaxyModel

# Referance ID, instaed of passng pointer
export var id:int 
# number sectors in the Galaxy
export var numSectors:int
# number of starting Civs
export var numSetlors:node
# numFaction
export var faction:node



func ready()->void:
    randomize()
    id = randi()

func set_numSectors() -> int:
    var LargeGalaxy = 512
    var MediumGalaxy = 256
    var SmallGalaxy = 128
    if id >= LargeGalaxy:
        numSectors = LargeGalxy
    if id >= MediumGalaxy and < LargGalaxy:
        numSectors = MediumGalaxy 
    if id >= SmallGalaxy and < MediumGalaxy:
        numSectors = SmallGalaxy
    return numSectors


func 




