use godot::prelude::*;
use serde::{Deserialize, Serialize};

/// State for save-file independent data like settings
#[derive(GodotClass, Debug, Serialize, Deserialize, Default, Clone)]
#[class(no_init)]
pub struct GlobalState {}
