import gleam/string

pub fn message(log_line: String) -> String {
  case log_line {
    "[INFO]: " <> message -> string.trim(message)
    "[WARNING]: " <> message -> string.trim(message)
    "[ERROR]: " <> message -> string.trim(message)
    _ -> panic as "Malformed log line"
  }
}

pub fn log_level(log_line: String) -> String {
  case log_line {
    "[INFO]" <> _ -> "info"
    "[WARNING]" <> _ -> "warning"
    "[ERROR]" <> _ -> "error"
    _ -> panic as "Malformed log line"
  }
}

pub fn reformat(log_line: String) -> String {
  message(log_line) <> " (" <> log_level(log_line) <> ")"
}
