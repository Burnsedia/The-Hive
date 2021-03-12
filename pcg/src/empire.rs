use gdnative::api::Node;
use gdnative::nativescript::user_data;

#[derive(NativeClass)]
#[inherit(Node)]
#[user_data(user_data::LocalCellData<empire>)]
pub struct empire;

#[gdnative::methods]
impl empire {
	fn new(_owner: &Node) -> Self {
		empire
	}

	#[export]
	fn _ready(&self, _owner: &Node) {
		godot_print!("hello, world.");
	}
}
