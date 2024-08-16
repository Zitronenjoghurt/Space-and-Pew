use serde::{de::DeserializeOwned, Serialize};
use serde_json;

pub trait FromJsonString: Sized {
    fn from_json_string(json_string: &str) -> Result<Self, serde_json::Error>;
}

impl<T> FromJsonString for T
where
    T: DeserializeOwned,
{
    fn from_json_string(json_string: &str) -> Result<Self, serde_json::Error> {
        serde_json::from_str(json_string)
    }
}

pub trait ToJsonString {
    fn to_json_string(&self) -> Result<String, serde_json::Error>;
}

impl<T> ToJsonString for T
where
    T: Serialize,
{
    fn to_json_string(&self) -> Result<String, serde_json::Error> {
        serde_json::to_string(self)
    }
}
