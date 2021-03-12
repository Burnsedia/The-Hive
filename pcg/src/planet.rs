use gdnative::api::Node;
use gdnative::nativescript::user_data;

#[derive(NativeClass)]
#[inherit(Node)]
#[user_data(user_data::LocalCellData<planet>)]
pub struct planet;

#[gdnative::methods]
impl planet {
	fn new(_owner: &Node) -> Self {
		planet
	}

	#[export]
	fn _ready(&self, _owner: &Node) {
		godot_print!("hello, world.");
	}
}
