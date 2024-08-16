use godot::prelude::*;
use serde::{Deserialize, Serialize};

use crate::{
    structures::bitvector::BitVector,
    traits::{
        serde::{FromJsonString, ToJsonString},
        to_godot_array::ToGodotArray,
    },
};

#[derive(GodotClass, Debug, Serialize, Deserialize, Default, Clone)]
#[class(no_init)]
pub struct GameState {
    #[export]
    game_version: u32,
    #[export]
    file_index: u32,
    #[serde(default)]
    unlocked_ships: BitVector,
}

#[godot_api]
impl GameState {
    #[func]
    fn create_new(game_version: u32, file_index: u32) -> Gd<GameState> {
        let state = GameState {
            game_version,
            file_index,
            ..Default::default()
        };
        Gd::from_object(state)
    }

    #[func]
    fn to_json(&self) -> String {
        match self.to_json_string() {
            Ok(json) => json,
            Err(err) => {
                godot_error!("An error occured while serializing GameState: {}", err);
                String::new()
            }
        }
    }

    #[func]
    fn from_json(json_string: String) -> Option<Gd<GameState>> {
        match GameState::from_json_string(&json_string) {
            Ok(state) => Some(Gd::from_object(state)),
            Err(err) => {
                godot_error!("An error occured while deserializing GameState: {}", err);
                None
            }
        }
    }

    #[func]
    fn get_unlocked_ships(&self) -> Array<u8> {
        self.unlocked_ships.get_indices().to_godot_array()
    }

    #[func]
    fn unlock_ship(&mut self, ship_type: u8) {
        if ship_type >= 64 {
            return;
        }
        self.unlocked_ships.set(ship_type)
    }
}
