use serde::{Deserialize, Serialize};

#[derive(
    Debug, Default, Clone, Copy, PartialEq, Eq, PartialOrd, Ord, Hash, Serialize, Deserialize,
)]
pub struct BitVector(u64);

impl BitVector {
    pub fn from_u64(value: u64) -> Self {
        BitVector(value)
    }

    pub fn set(&mut self, index: u8) {
        if index >= 64 {
            panic!("Index out of bounds: {} (should be 0-63)", index);
        }
        self.0 |= 1 << index;
    }

    pub fn unset(&mut self, index: u8) {
        if index >= 64 {
            panic!("Index out of bounds: {} (should be 0-63)", index);
        }
        self.0 &= !(1 << index);
    }

    pub fn get(&self, index: u8) -> bool {
        if index >= 64 {
            panic!("Index out of bounds: {} (should be 0-63)", index);
        }
        (self.0 & (1 << index)) != 0
    }

    pub fn get_indices(&self) -> Vec<u8> {
        (0..64).filter(|&i| self.get(i)).collect()
    }

    pub fn as_u64(&self) -> u64 {
        self.0
    }
}
