#[macro_use]
extern crate gdnative;

mod galaxy;
mod starsystem;
mod planet;
mod empire;

fn init(handle: gdnative::nativescript::InitHandle) {
	handle.add_class::<galaxy::Galaxy>();
	handle.add_class::<::starsystem>();
	handle.add_class::<::planet>();
	handle.add_class::<::empire>();
}

godot_init!(init);
