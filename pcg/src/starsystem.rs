use gdnative::api::Resource;
use gdnative::nativescript::user_data;

#[derive(NativeClass)]
#[inherit(Resource)]
#[user_data(user_data::LocalCellData<starsystem>)]
pub struct starsystem{
	name: String,
	radius: f32,
	//Number of astroids in a star system or sector
	numastroids: i16,
	// number of stations
	numstation: i8

}

#[gdnative::methods]
impl starsystem {
	fn new(_owner: &Resource) -> Self {
		starsystem
	}

	#[export]
	fn _ready(&self, _owner: &Resource) {
		godot_print!("hello, world.");
	}
}
