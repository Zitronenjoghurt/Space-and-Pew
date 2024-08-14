use godot::prelude::*;

use crate::{config::Config, global_state::GlobalState, traits::serde::FromJsonString};

#[derive(GodotClass, Debug, Clone, Default)]
#[class(no_init)]
pub struct LogicInterface {
    global_state: GlobalState,
    config: Config,
}

#[godot_api]
impl LogicInterface {
    #[func]
    fn load(global_state_json: String) -> Gd<LogicInterface> {
        Gd::from_object(LogicInterface::new(global_state_json))
    }

    pub fn new(global_state_json: String) -> LogicInterface {
        let mut interface = LogicInterface::default();
        interface.global_state = GlobalState::from_json_string(&global_state_json);
        interface.config = Config::load();
        interface
    }
}

#[cfg(test)]
pub mod tests {
    use super::LogicInterface;

    #[test]
    fn test_initialization() {
        let interface = LogicInterface::new("{}".to_string());
        assert_eq!(interface.config.version, 1);
    }
}
