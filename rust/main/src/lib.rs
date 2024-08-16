use godot::prelude::*;

struct MainExtension;

#[gdextension]
unsafe impl ExtensionLibrary for MainExtension {}

pub mod config;
pub mod game_state;
pub mod global_state;
pub mod interface;

pub mod entities {
    pub mod player_configuration;
}

pub mod enums {
    pub mod player_ship_type;
}

pub mod traits {
    pub mod serde;
}
