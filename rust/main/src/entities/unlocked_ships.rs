use godot::prelude::*;
use serde::{Deserialize, Serialize};
use std::collections::HashMap;

#[derive(GodotClass, Debug, Serialize, Deserialize, Default, Clone)]
#[class(no_init)]
pub struct ShipUpgrades {
    #[serde(flatten)]
    upgrades: HashMap<u32, u32>,
}

#[derive(Debug, Serialize, Deserialize, Clone)]
pub struct UnlockedShips {
    #[serde(flatten)]
    weapons: HashMap<u32, ShipUpgrades>,
}

// Immediately unlock starter ship but without upgrades
impl Default for UnlockedShips {
    fn default() -> Self {
        let mut weapons: HashMap<u32, ShipUpgrades> = HashMap::new();
        weapons.insert(0, ShipUpgrades::default());
        Self { weapons }
    }
}

impl UnlockedShips {
    pub fn unlock_weapon(&mut self, weapon_id: u32) {
        self.weapons.entry(weapon_id).or_default();
    }

    pub fn get_upgrades(&self, weapon_id: u32) -> ShipUpgrades {
        if let Some(upgrades) = self.weapons.get(&weapon_id) {
            upgrades.clone()
        } else {
            ShipUpgrades::default()
        }
    }
}
