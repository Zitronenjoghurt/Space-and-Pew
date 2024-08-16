use godot::prelude::*;
use serde::{Deserialize, Serialize};

use crate::traits::serde::{FromJsonString, ToJsonString};

/// State for save-file independent data like settings
#[derive(GodotClass, Debug, Serialize, Deserialize, Default, Clone)]
#[class(no_init)]
pub struct GlobalState {}

#[godot_api]
impl GlobalState {
    #[func]
    fn create_new() -> Gd<GlobalState> {
        let state = GlobalState {};
        Gd::from_object(state)
    }

    #[func]
    fn to_json(&self) -> String {
        match self.to_json_string() {
            Ok(json) => json,
            Err(err) => {
                godot_error!("An error occured while serializing GlobalState: {}", err);
                String::new()
            }
        }
    }

    #[func]
    fn from_json(json_string: String) -> Option<Gd<GlobalState>> {
        match GlobalState::from_json_string(&json_string) {
            Ok(state) => Some(Gd::from_object(state)),
            Err(err) => {
                godot_error!("An error occured while deserializing GlobalState: {}", err);
                None
            }
        }
    }
}
