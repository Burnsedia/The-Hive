use gdnative::api::Node;
use gdnative::nativescript::user_data;

#[derive(NativeClass)]
#[inherit(Node)]
#[user_data(user_data::LocalCellData<starsystem>)]
pub struct starsystem;

#[gdnative::methods]
impl starsystem {
	fn new(_owner: &Node) -> Self {
		starsystem
	}

	#[export]
	fn _ready(&self, _owner: &Node) {
		godot_print!("hello, world.");
	}
}
