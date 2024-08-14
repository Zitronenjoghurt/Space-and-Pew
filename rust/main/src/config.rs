use godot::prelude::*;

#[derive(GodotClass, Debug, Clone, Default)]
#[class(no_init)]
pub struct Config {
    pub version: u32,
}

impl Config {
    pub fn load() -> Config {
        Config { version: 1 }
    }
}
