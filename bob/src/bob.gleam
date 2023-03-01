import gleam/string.{last, lowercase, trim, uppercase}

pub fn hey(remark: String) -> String {
  let str = trim(remark)

  let question = last(str) == Ok("?")
  // We use the lowercase check to make sure that the string contains
  // some letters at least. For example, if we pass in "1, 2, 3", then
  // the simple check of just uppercase will tell us that we are yelling,
  // even though we are not. The check for lowercase is a clever way to
  // avoid that.
  let yelling = str == uppercase(str) && str != lowercase(str)
  let nothing = str == ""

  case True {
    _ if question && yelling -> "Calm down, I know what I'm doing!"
    _ if yelling -> "Whoa, chill out!"
    _ if question -> "Sure."
    _ if nothing -> "Fine. Be that way!"
    _ -> "Whatever."
  }
}
