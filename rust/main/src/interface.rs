use godot::prelude::*;

use crate::{
    config::Config, game_state::GameState, global_state::GlobalState, traits::serde::FromJsonString,
};

#[derive(GodotClass, Debug, Clone, Default)]
#[class(no_init)]
pub struct LogicInterface {
    config: Config,
    game_state: Option<GameState>,
    global_state: GlobalState,
}

#[godot_api]
impl LogicInterface {
    #[func]
    fn load(global_state_json: String) -> Gd<LogicInterface> {
        Gd::from_object(LogicInterface::new(global_state_json))
    }

    #[func]
    fn load_game(&mut self, game_state_json: String) {
        let game_state = GameState::from_json_string(&game_state_json);
        self.game_state = Some(game_state)
    }

    pub fn new(global_state_json: String) -> LogicInterface {
        LogicInterface {
            global_state: GlobalState::from_json_string(&global_state_json),
            config: Config::load(),
            ..Default::default()
        }
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
