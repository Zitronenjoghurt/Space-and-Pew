use godot::prelude::*;
use serde::{Deserialize, Serialize};

use crate::traits::serde::ToJsonString;

#[derive(GodotClass, Debug, Serialize, Deserialize, Default, Clone)]
#[class(no_init)]

pub struct GameState {}

#[godot_api]
impl GameState {
    #[func]
    fn to_json(&self) -> String {
        self.to_json_string()
    }
}
