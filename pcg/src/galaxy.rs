use gdnative::api::Node;
use gdnative::nativescript::user_data;

#[derive(NativeClass)]
#[inherit(Node)]
#[user_data(user_data::LocalCellData<Galaxy>)]
pub struct Galaxy;

#[gdnative::methods]
impl Galaxy {
	fn new(_owner: &Node) -> Self {
		Galaxy
	}

	#[export]
	fn _ready(&self, _owner: &Node) {
		godot_print!("hello, world.");
	}
}
