use godot::prelude::*;
use serde_repr::{Deserialize_repr, Serialize_repr};

#[derive(
    GodotConvert,
    Var,
    Export,
    Debug,
    Clone,
    Copy,
    Serialize_repr,
    Deserialize_repr,
    PartialEq,
    Eq,
    PartialOrd,
    Ord,
)]
#[repr(u32)]
#[godot(via = u32)]
pub enum PlayerShipType {
    WhiteWing = 0,
    GoldenHawk = 1,
    GreenLight = 2,
    PurpleThunder = 3,
    RedFalcon = 4,
}

impl Default for PlayerShipType {
    fn default() -> Self {
        Self::WhiteWing
    }
}
