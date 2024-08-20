use godot::prelude::*;

struct MainExtension;

#[gdextension]
unsafe impl ExtensionLibrary for MainExtension {}

pub mod game_state;
pub mod global_state;

pub mod entities {
    pub mod unlocked_ships;
    pub mod unlocked_weapons;
}

pub mod structures {
    pub mod bitvector;
}

pub mod traits {
    pub mod serde;
    pub mod to_godot_array;
}
