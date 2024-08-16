use godot::prelude::*;
use serde::{Deserialize, Serialize};

use crate::traits::serde::ToJsonString;

/// State for save-file independent data like settings
#[derive(GodotClass, Debug, Serialize, Deserialize, Default, Clone)]
#[class(no_init)]
pub struct GlobalState {}

#[godot_api]
impl GlobalState {
    #[func]
    fn to_json(&self) -> String {
        self.to_json_string()
    }
}
