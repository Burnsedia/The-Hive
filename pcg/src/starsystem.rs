use gdnative::api::Resource;
use gdnative::nativescript::user_data;

#[derive(NativeClass)]
#[inherit(Node)]
#[user_data(user_data::LocalCellData<starsystem>)]
pub struct starsystem{
	name: String;
	radius: f32;
	numstarts
}

#[gdnative::methods]
impl starsystem {
	fn new(_owner: &Resource) -> Self {
		starsystem
	}

	#[export]
	fn _ready(&self, _owner: &Node) {
		godot_print!("hello, world.");
	}
}
