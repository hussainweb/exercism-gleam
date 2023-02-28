import gleam/option.{Option, unwrap}

pub fn two_fer(name: Option(String)) -> String {
  let str = unwrap(name, "you")
  "One for " <> str <> ", one for me."
}
