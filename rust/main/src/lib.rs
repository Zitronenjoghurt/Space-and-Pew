use godot::prelude::*;

struct MainExtension;

#[gdextension]
unsafe impl ExtensionLibrary for MainExtension {}
