import gleam/list.{reverse}

pub fn accumulate(list: List(a), fun: fn(a) -> b) -> List(b) {
  do_accumulate(list, fun, [])
}

fn do_accumulate(list: List(a), fun: fn(a) -> b, acc: List(b)) -> List(b) {
  case list {
    [] -> reverse(acc)
    [x, ..xs] -> do_accumulate(xs, fun, [fun(x), ..acc])
  }
}
