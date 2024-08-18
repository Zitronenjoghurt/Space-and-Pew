use godot::prelude::*;
use serde::{Deserialize, Serialize};
use std::collections::HashMap;

#[derive(GodotClass, Debug, Serialize, Deserialize, Default, Clone)]
#[class(no_init)]
pub struct WeaponUpgrades {
    #[serde(flatten)]
    upgrades: HashMap<u32, u32>,
}

#[derive(Debug, Serialize, Deserialize, Default, Clone)]
pub struct UnlockedWeapons {
    #[serde(flatten)]
    weapons: HashMap<u32, WeaponUpgrades>,
}

impl UnlockedWeapons {
    pub fn unlock_weapon(&mut self, weapon_id: u32) {
        self.weapons.entry(weapon_id).or_default();
    }

    pub fn get_upgrades(&self, weapon_id: u32) -> WeaponUpgrades {
        if let Some(upgrades) = self.weapons.get(&weapon_id) {
            upgrades.clone()
        } else {
            WeaponUpgrades::default()
        }
    }
}
