extends Node

# Combat Events
signal Shoot(Bulit, Direction, Position)
signal StationDistroyed(StationDistroyed, StationType)
signal ShipDistroyed(ShipDistroyed, ShipType)

# Hive Factin Events
# These are objectives for the Main Campine and Arcade Senarios
signal MotherShipDistroyed()
signal HiveStationDistroyed()

# Sector status changed
signal SectorContested(ContestedSector, SectorOwner, Agressor)
signal SectorConquored(ConqueredSector, NowOwner, LastOwner)
