use godot::prelude::*;
use serde::{Deserialize, Serialize};

use crate::enums::player_ship_type::PlayerShipType;

#[derive(GodotClass, Debug, Serialize, Deserialize, Default, Clone)]
#[class(init)]

pub struct PlayerConfiguration {
    #[export]
    ship_type: PlayerShipType,
    #[export]
    acceleration: u32,
    #[export]
    rotation_speed: u32,
    #[export]
    max_speed: u32,
    #[export]
    drag_factor: f32,
}
