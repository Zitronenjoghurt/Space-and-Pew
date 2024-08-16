use godot::prelude::*;
use serde_repr::{Deserialize_repr, Serialize_repr};

/// Currently limited to 64 (0-63).
/// Its value has to be storable in a u64 bitvector.
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
#[repr(u8)]
#[godot(via = u8)]
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
