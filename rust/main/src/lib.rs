use godot::prelude::*;

struct MainExtension;

#[gdextension]
unsafe impl ExtensionLibrary for MainExtension {}

pub mod config;
pub mod global_state;
pub mod interface;

pub mod traits {
    pub mod serde;
}
